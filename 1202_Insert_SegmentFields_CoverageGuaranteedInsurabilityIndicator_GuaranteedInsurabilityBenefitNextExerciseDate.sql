DECLARE 
    VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
BEGIN 
	-- Insert CoverageGuaranteedInsurabilityIndicator in AsSegmentField
	VSQL1:='
		INSERT INTO AsSegmentField (SegmentGUID, FieldName, FieldTypeCode, TextValue)
		SELECT SegmentGUID, ''CoverageGuaranteedInsurabilityIndicator'', ''02'', ''UNCHECKED''
		FROM AsSegment
		WHERE AsSegment.SegmentGUID NOT IN 
			(
				SELECT AsSegmentField.SegmentGUID
				FROM AsSegment
				JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID
				WHERE AsSegmentField.FieldName = ''CoverageGuaranteedInsurabilityIndicator''
			)';
	-- Insert GuaranteedInsurabilityBenefitNextExerciseDate in AsSegmentField for GuaranteedInsurabilityCoverages
	VSQL2:='
		INSERT INTO AsSegmentField (SegmentGUID, FieldName, FieldTypeCode)
		SELECT SegmentGUID, ''GuaranteedInsurabilityBenefitNextExerciseDate'', ''01''
		FROM AsSegment 
		JOIN AsSegmentName ON AsSegmentName.SegmentNameGUID = AsSegment.SegmentNameGUID
			AND AsSegmentName.TypeCode = ''33''
		WHERE AsSegment.SegmentGUID NOT IN 
			(
				SELECT AsSegment.SegmentGUID 
				FROM AsSegment
				JOIN AsSegmentField ON AsSegment.SegmentGUID = AsSegmentField.SegmentGUID
					AND AsSegmentField .FieldName = ''GuaranteedInsurabilityBenefitNextExerciseDate''
				JOIN AsSegmentName ON AsSegmentName.SegmentNameGUID = AsSegment.SegmentNameGUID
					AND AsSegmentName.TypeCode = ''33''
			)';
			
	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
END;

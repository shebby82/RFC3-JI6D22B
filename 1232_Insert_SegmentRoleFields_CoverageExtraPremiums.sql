DECLARE
	VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
	VSQL3 VARCHAR2(32767);
	VSQL4 VARCHAR2(32767);
	VSQL5 VARCHAR2(32767);
	VSQL6 VARCHAR2(32767);
	VSQL7 VARCHAR2(32767);
	VSQL8 VARCHAR2(32767);
	VSQL9 VARCHAR2(32767);
	VSQL10 VARCHAR2(32767);
	VSQL11 VARCHAR2(32767);
	VSQL12 VARCHAR2(32767);
	VSQL13 VARCHAR2(32767);
	VSQL14 VARCHAR2(32767);
	VSQL15 VARCHAR2(32767);
	VSQL16 VARCHAR2(32767);
	VSQL17 VARCHAR2(32767);
	VSQL18 VARCHAR2(32767);
	VSQL19 VARCHAR2(32767);
	VSQL20 VARCHAR2(32767);
	VSQL21 VARCHAR2(32767);
	VRESULT VARCHAR2(200);

BEGIN
	-- Insert FieldName CoverageExtraPremiumTypeCodePRP in Segment RoleField
	VSQL1:= '
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTypeCodePRP'', ''02'', ''PRP'', 1, ''AsCodeExtraPremiumType.PRPLD''
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTypeCodePRP''
				)
		   ';
	
	-- Insert CoverageExtraPremiumRatingPRP in Segment RoleField
	VSQL2:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumRatingPRP'', ''04'', AsSegmentField.FloatValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumRatingPRP''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumRatingPRP''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumAmountPRP in Segment RoleField
	VSQL3:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumAmountPRP'', ''04'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumAmountPRP''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumDurationPRP in Segment RoleField
	VSQL4:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, IntValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumDurationPRP'', ''03'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumDurationPRP''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumExpiryDatePRP in Segment RoleField
	VSQL5:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumExpiryDatePRP'', ''01'', AsSegmentField.DateValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumExpiryDatePRP''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumExpiryDatePRP''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumTotalAmountPRP in Segment RoleField
	VSQL6:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTotalAmountPRP'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumPRP''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTotalAmountPRP''
				)
		   ';
		   
	-- Delete ExtraPremiumPRP Fields from Segment
	VSQL7:='
		DELETE FROM AsSegmentField
		WHERE FieldName IN (''CoverageExtraPremiumCategoryPRP'', ''CoverageExtraPremiumExpiryDatePRP'', ''CoverageExtraPremiumRatingPRP'', ''CoverageExtraPremiumPRP'')
		   ';


	-- Insert FieldName CoverageExtraPremiumTypeCodePRD in Segment RoleField
	VSQL8:= '
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTypeCodePRD'', ''02'', ''PRD'', 1, ''AsCodeExtraPremiumType.PRDLD''
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTypeCodePRD''
				)
		   ';
	
	-- Insert CoverageExtraPremiumRatingPRD in Segment RoleField
	VSQL9:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumRatingPRD'', ''04'', AsSegmentField.FloatValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumRatingPRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumRatingPRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumAmountPRD in Segment RoleField
	VSQL10:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumAmountPRD'', ''04'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumAmountPRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumDurationPRD in Segment RoleField
	VSQL11:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, IntValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumDurationPRD'', ''03'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumDurationPRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumExpiryDatePRD in Segment RoleField
	VSQL12:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumExpiryDatePRD'', ''01'', AsSegmentField.DateValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumExpiryDatePRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumExpiryDatePRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumTotalAmountPRD in Segment RoleField
	VSQL13:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTotalAmountPRD'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumPRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTotalAmountPRD''
				)
		   ';
		   
	-- Delete ExtraPremiumPRD Fields from Segment
	VSQL14:='
		DELETE FROM AsSegmentField
		WHERE FieldName IN (''CoverageExtraPremiumCategoryPRD'', ''CoverageExtraPremiumExpiryDatePRD'', ''CoverageExtraPremiumRatingPRD'', ''CoverageExtraPremiumPRD'')
		   ';


	-- Insert FieldName CoverageExtraPremiumTypeCodeTRD in Segment RoleField
	VSQL15:= '
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTypeCodeTRD'', ''02'', ''TRD'', 1, ''AsCodeExtraPremiumType.TRDLD''
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTypeCodeTRD''
				)
		   ';
	
	-- Insert CoverageExtraPremiumRatingTRD in Segment RoleField
	VSQL16:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumRatingTRD'', ''04'', AsSegmentField.FloatValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumRatingTRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumRatingTRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumAmountTRD in Segment RoleField
	VSQL17:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumAmountTRD'', ''04'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumAmountTRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumDurationTRD in Segment RoleField
	VSQL18:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, IntValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumDurationTRD'', ''03'', 0
			FROM AsSegment
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumDurationTRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumExpiryDateTRD in Segment RoleField
	VSQL19:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumExpiryDateTRD'', ''01'', AsSegmentField.DateValue
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumExpiryDateTRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumExpiryDateTRD''
				)
		   ';
		   
	-- Insert CoverageExtraPremiumTotalAmountTRD in Segment RoleField
	VSQL20:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT AsRole.RoleGUID, ''CoverageExtraPremiumTotalAmountTRD'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
			FROM AsSegment
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageExtraPremiumTRD''
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
				AND AsRole.RoleCode = ''37''
			WHERE AsRole.RoleGUID NOT IN 
				(
					SELECT RoleGUID 
					FROM AsRoleField 
					WHERE FieldName = ''CoverageExtraPremiumTotalAmountTRD''
				)
		   ';
		   
	-- Delete ExtraPremiumTRD Fields from Segment
	VSQL21:='
		DELETE FROM AsSegmentField
		WHERE FieldName IN (''CoverageExtraPremiumCategoryTRD'', ''CoverageExtraPremiumExpiryDateTRD'', ''CoverageExtraPremiumRatingTRD'', ''CoverageExtraPremiumTRD'')
		   ';
		   
    VRESULT := NULL;
	
	EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
	EXECUTESQL ( VSQL3, VRESULT );
	EXECUTESQL ( VSQL4, VRESULT );
	EXECUTESQL ( VSQL5, VRESULT );
	EXECUTESQL ( VSQL6, VRESULT );
	EXECUTESQL ( VSQL7, VRESULT );
	EXECUTESQL ( VSQL8, VRESULT );
	EXECUTESQL ( VSQL9, VRESULT );
	EXECUTESQL ( VSQL10, VRESULT );
	EXECUTESQL ( VSQL11, VRESULT );
	EXECUTESQL ( VSQL12, VRESULT );
	EXECUTESQL ( VSQL13, VRESULT );
	EXECUTESQL ( VSQL14, VRESULT );
	EXECUTESQL ( VSQL15, VRESULT );
	EXECUTESQL ( VSQL16, VRESULT );
	EXECUTESQL ( VSQL17, VRESULT );
	EXECUTESQL ( VSQL18, VRESULT );
	EXECUTESQL ( VSQL19, VRESULT );
	EXECUTESQL ( VSQL20, VRESULT );
	EXECUTESQL ( VSQL21, VRESULT );
END;
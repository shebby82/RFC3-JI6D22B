DECLARE 
    VSQL1 VARCHAR2(32767);
    VSQL2 VARCHAR2(32767);
    VRESULT VARCHAR2(200); 
    
    BEGIN
    
    -- Insert InsuranceBasis in AsSegmentField
    VSQL1:='
        INSERT INTO AsSegmentField (SegmentGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
        SELECT SegmentGUID, ''InsuranceBasis'', ''02'', ''INDV'', 1, ''AsCodeInsuranceBasis.IndividualSD''
        FROM (
            SELECT AsSegment.SegmentGUID
            FROM AsSegment
            WHERE AsSegment.SegmentGUID NOT IN (
                SELECT SegmentGUID
                FROM AsSegmentField
                WHERE FieldName = ''InsuranceBasis''
                )
            )';
    
    -- Insert CoverageVersion in AsSegmentField
    VSQL2:='
        INSERT INTO AsSegmentField (SegmentGUID, FieldName, FieldTypeCode, TextValue)
        SELECT SegmentGUID, ''CoverageVersion'', ''02'', SUBSTR(TextValue,(INSTR(REVERSE(TextValue),''-'')-1)*-1)
        FROM (
            SELECT AsSegment.SegmentGUID, AsSegmentField.TextValue
            FROM AsSegment
            INNER JOIN AsSegmentField ON AsSegment.SegmentGUID = AsSegmentField.SegmentGUID
                AND AsSegmentField.FieldName = ''CoverageVersionCode''
            WHERE AsSegment.SegmentGUID NOT IN (
                SELECT SegmentGUID
                FROM AsSegmentField
                WHERE FieldName = ''CoverageVersion''
                )
            )';
    
    VRESULT := NULL;
    EXECUTESQL ( VSQL1, VRESULT );
    EXECUTESQL ( VSQL2, VRESULT );

END;

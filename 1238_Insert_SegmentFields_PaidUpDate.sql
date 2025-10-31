DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);

BEGIN 
-- Insert PaidUpDate in SegmentField for TermLife
VSQL1:='
	INSERT INTO AsSegmentField (SegmentGUID, FieldName, FieldTypeCode)
	SELECT SegmentGUID, ''PaidUpDate'', ''01''
	FROM (
		SELECT AsSegment.SegmentGUID
		FROM AsSegment
		JOIN AsSegmentName ON AsSegmentName.SegmentNameGUID = AsSegment.SegmentNameGUID 
			AND AsSegmentName.TypeCode = ''24''		
		WHERE AsSegment.SegmentGUID NOT IN (
			SELECT SegmentGUID FROM AsSegmentField
			WHERE FieldName = ''PaidUpDate''
		)
	)';
	
VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	
END;
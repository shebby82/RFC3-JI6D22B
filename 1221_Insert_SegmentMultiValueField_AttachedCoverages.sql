DECLARE
	VSQL1 VARCHAR2(32767);
	VRESULT VARCHAR2(200);

BEGIN
-- Insert FieldName AttachedCoverage in SegmentMultiValueField 
VSQL1:= '
	INSERT INTO AsSegmentMultiValueField (SegmentGUID, FieldName, FieldIndex, FieldTypeCode, TextValue)
	SELECT AsSegment.SegmentGUID, ''AttachedCoverage'' AS FieldName,
		CASE 
			WHEN AsSegmentField.FieldName = ''AttachedCoverage1'' THEN 0
			WHEN AsSegmentField.FieldName = ''AttachedCoverage2'' THEN 1
			WHEN AsSegmentField.FieldName = ''AttachedCoverage3'' THEN 2
			WHEN AsSegmentField.FieldName = ''AttachedCoverage4'' THEN 3
			WHEN AsSegmentField.FieldName = ''AttachedCoverage5''  THEN 4
			WHEN AsSegmentField.FieldName = ''AttachedCoverage6''  THEN 5
			WHEN AsSegmentField.FieldName = ''AttachedCoverage7''  THEN 6
			WHEN AsSegmentField.FieldName = ''AttachedCoverage8''  THEN 7
			WHEN AsSegmentField.FieldName = ''AttachedCoverage9''  THEN 8
			WHEN AsSegmentField.FieldName = ''AttachedCoverage10''  THEN 9
			WHEN AsSegmentField.FieldName = ''AttachedCoverage11''  THEN 10
			WHEN AsSegmentField.FieldName = ''AttachedCoverage12''  THEN 11
			WHEN AsSegmentField.FieldName = ''AttachedCoverage13''  THEN 12
			WHEN AsSegmentField.FieldName = ''AttachedCoverage14''  THEN 13
			WHEN AsSegmentField.FieldName = ''AttachedCoverage15''  THEN 14
			WHEN AsSegmentField.FieldName = ''AttachedCoverage16''  THEN 15
			WHEN AsSegmentField.FieldName = ''AttachedCoverage17''  THEN 16
			WHEN AsSegmentField.FieldName = ''AttachedCoverage18''  THEN 17
			WHEN AsSegmentField.FieldName = ''AttachedCoverage19''  THEN 18
			WHEN AsSegmentField.FieldName = ''AttachedCoverage20''  THEN 19
			WHEN AsSegmentField.FieldName = ''AttachedCoverage21''  THEN 20
			WHEN AsSegmentField.FieldName = ''AttachedCoverage22''  THEN 21
			WHEN AsSegmentField.FieldName = ''AttachedCoverage23''  THEN 22
			WHEN AsSegmentField.FieldName = ''AttachedCoverage24''  THEN 23
			WHEN AsSegmentField.FieldName = ''AttachedCoverage25''  THEN 24
			WHEN AsSegmentField.FieldName = ''AttachedCoverage26''  THEN 25
			WHEN AsSegmentField.FieldName = ''AttachedCoverage27''  THEN 26
			WHEN AsSegmentField.FieldName = ''AttachedCoverage28''  THEN 27
			WHEN AsSegmentField.FieldName = ''AttachedCoverage29''  THEN 28
			WHEN AsSegmentField.FieldName = ''AttachedCoverage30''  THEN 29
		END AS FieldIndex, 
		''02'' AS FieldTypeCode, 
		AsSegmentField.TextValue
	FROM AsSegment
	JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
		AND AsSegmentField.FieldName LIKE ''%AttachedCoverage%''
	WHERE AsSegmentField.TextValue IS NOT NULL
		AND AsSegmentField.SegmentGUID NOT IN 
			(	
				SELECT SegmentGUID 
				FROM AsSegmentMultiValueField 
				WHERE FieldName LIKE ''%AttachedCoverage%''
			)
	';
	
    VRESULT := NULL;
	EXECUTESQL ( VSQL1, VRESULT );

END;
DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);

BEGIN
	-- Insert RoleField Insured on Reinsurer 
	VSQL1:=
		'
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue)
		SELECT Reinsurer.RoleGUID, ''Insured'', ''02'', Insured.RoleGUID
		FROM AsRole Reinsurer
		JOIN ( SELECT SegmentGUID, MAX(RoleGUID) AS RoleGUID
		        FROM AsRole
		        WHERE RoleCode IN (''37'', ''21'')
		    	AND SegmentGUID IS NOT NULL
		    	AND StatusCode = ''01''
		    	GROUP BY SegmentGUID
		) Insured ON Insured.SegmentGUID = Reinsurer.SegmentGUID			
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.StatusCode = ''01''
		AND Reinsurer.RoleGUID NOT IN (
			SELECT RoleGUID 
			FROM AsRoleField 
			WHERE FieldName = ''Insured''
			)
		';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );

END;
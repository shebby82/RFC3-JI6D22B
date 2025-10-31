DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);

BEGIN 
/* Remove the AttachedCoverageXX  */
VSQL1:=	'
	DELETE FROM AsSegmentField
	WHERE AsSegmentField.FieldName LIKE ''AttachedCoverage%''
';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	
END;
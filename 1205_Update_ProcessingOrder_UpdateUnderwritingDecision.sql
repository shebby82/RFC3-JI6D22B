DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
BEGIN 
VSQL1:='
	UPDATE AsActivity SET ProcessingOrder = ''35000''
	WHERE ActivityGUID IN (		 
		SELECT AsActivity.ActivityGUID
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		WHERE TransactionName = ''UpdateUnderwritingDecision''
		) 
	';
	
	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );

END;
DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
BEGIN 
VSQL1:='
	UPDATE AsActivity SET ProcessingOrder = ''40710''
	WHERE ActivityGUID IN (		 
		SELECT AsActivity.ActivityGUID
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		WHERE TransactionName = ''ReceiveContractPublicationConfirmation''
		) 
	';
	
	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );

END;
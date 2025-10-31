DECLARE 
    VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
	VSQL3 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
  

BEGIN
-- Insert Fieldname ClaimNumber in Transaction MoneyOut 
		VSQL1:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode)
		SELECT ActivityGUID, ''ClaimNumber'', ''02''
		FROM (
			SELECT AsActivity.ActivityGUID FROM AsActivity
			JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
				AND AsTransaction.TransactionName IN (''MoneyOut'')
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID FROM AsActivity
				JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
					AND AsTransaction.TransactionName IN (''MoneyOut'')
				JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
					AND AsActivityField.FieldName = ''ClaimNumber''
			)
		)';

-- Insert FieldName RetainedAmount in Transaction MoneyOut
	VSQL2:= '
    	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
    	SELECT ActivityGUID, ''RetainedAmount'', ''04'', 0, ''CAD''
    	FROM AsActivity
    	WHERE ActivityGUID IN 
			(
			SELECT AsActivity.ActivityGUID FROM AsActivity
			JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
				AND AsTransaction.TransactionName = ''MoneyOut''
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID FROM AsActivity
				JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
					AND AsTransaction.TransactionName = ''MoneyOut''
				JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
					AND AsActivityField.FieldName = ''RetainedAmount'' )
			)'
		;
-- Insert FieldName TerminatePolicyEffectiveDate in Transaction MoneyOut
	VSQL3:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode)
		SELECT ActivityGUID, ''TerminatePolicyEffectiveDate'', ''01''
		FROM AsActivity
		WHERE ActivityGUID IN
			(
			SELECT AsActivity.ActivityGUID
			FROM AsActivity
			JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
			AND AsTransaction.TransactionName = ''MoneyOut''
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID
				FROM AsActivity
				JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
					AND AsActivityField.FieldName = ''TerminatePolicyEffectiveDate''
				JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
					AND AsTransaction.TransactionName = ''MoneyOut''
				)
			)'
		;
	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
	EXECUTESQL ( VSQL3, VRESULT );
    
END;

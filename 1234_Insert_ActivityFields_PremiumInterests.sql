DECLARE 
    VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
	VSQL3 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
  

BEGIN
-- Insert Fieldname PremiumInterestInArrearsPaymentAmount in Transactions BankDraftAdHoc, BankDraftAdHocNBU 
	VSQL1:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
    	SELECT ActivityGUID, ''PremiumInterestInArrearsPaymentAmount'', ''04'', 0, ''CAD''
    	FROM AsActivity
    	WHERE ActivityGUID IN 
			(
			SELECT AsActivity.ActivityGUID FROM AsActivity
			JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
				AND AsTransaction.TransactionName IN (''BankDraftAdHoc'', ''BankDraftAdHocNBU'')
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID FROM AsActivity
				JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
					AND AsTransaction.TransactionName IN (''BankDraftAdHoc'', ''BankDraftAdHocNBU'')
				JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
					AND AsActivityField.FieldName = ''PremiumInterestInArrearsPaymentAmount'' )
			)'
    	;

-- Insert FieldName InterestsPaymentAmount in Transaction CancelPayment
	VSQL2:= '
    	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
    	SELECT ActivityGUID, ''InterestsPaymentAmount'', ''04'', 0, ''CAD''
    	FROM AsActivity
    	WHERE ActivityGUID IN 
			(
			SELECT AsActivity.ActivityGUID FROM AsActivity
			JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
				AND AsTransaction.TransactionName = ''CancelPayment''
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID FROM AsActivity
				JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
					AND AsTransaction.TransactionName = ''CancelPayment''
				JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
					AND AsActivityField.FieldName = ''InterestsPaymentAmount'' )
			)'
		;
-- Insert FieldName TotalPremiumInterestInArrears in Transaction MoneyIn
	VSQL3:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT ActivityGUID, ''TotalPremiumInterestInArrears'', ''04'', 0, ''CAD''
		FROM AsActivity
		WHERE ActivityGUID IN
			(
			SELECT AsActivity.ActivityGUID
			FROM AsActivity
			JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
			AND AsTransaction.TransactionName = ''MoneyIn''
			WHERE AsActivity.ActivityGUID NOT IN (
				SELECT AsActivity.ActivityGUID
				FROM AsActivity
				JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
					AND AsActivityField.FieldName = ''TotalPremiumInterestInArrears''
				JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
					AND AsTransaction.TransactionName = ''MoneyIn''
				)
			)'
		;
	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
	EXECUTESQL ( VSQL3, VRESULT );
    
END;

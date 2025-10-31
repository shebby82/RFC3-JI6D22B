DECLARE
	VSQL1 VARCHAR2(32767);
	VRESULT VARCHAR2(200);

BEGIN
-- Insert FieldName Reason in Transactions 
-- ChangeServicingAgency, ChangeServicingAgencyAtIssue
VSQL1:= '
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
	SELECT ActivityGUID, ''ChangeServicingAgencyReason'', ''02'', ''00'', 1, ''AsCodeComboNASD''
	FROM (
        SELECT AsActivity.ActivityGUID FROM AsActivity
        JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
            AND AsTransaction.TransactionName IN (''ChangeServicingAgency'', ''ChangeServicingAgencyAtIssue'')
        WHERE AsActivity.ActivityGUID NOT IN (
            SELECT AsActivity.ActivityGUID FROM AsActivity
            JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
                AND AsTransaction.TransactionName IN (''ChangeServicingAgency'', ''ChangeServicingAgencyAtIssue'')
            JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
                AND AsActivityField.FieldName = ''ChangeServicingAgencyReason''
        )
	)';

    VRESULT := NULL;
	EXECUTESQL ( VSQL1, VRESULT );

END;
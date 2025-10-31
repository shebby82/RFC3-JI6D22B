DECLARE
	VSQL1 VARCHAR2(32767);
	VRESULT VARCHAR2(200);

BEGIN
-- Insert FieldName ProduceDocumentCheckBox in PrepareBillingActivities and AddCoveragesFromApplication
VSQL1:= '
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
	SELECT ActivityGUID, ''ProduceDocumentCheckBox'', ''02'', ''CHECKED''
	FROM (
        SELECT AsActivity.ActivityGUID FROM AsActivity
        JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
            AND AsTransaction.TransactionName IN (''PrepareBillingActivities'',''AddCoveragesFromApplication'')
        WHERE AsActivity.ActivityGUID NOT IN (
            SELECT AsActivity.ActivityGUID FROM AsActivity
            JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
                AND AsTransaction.TransactionName IN (''PrepareBillingActivities'',''AddCoveragesFromApplication'')
            JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID 
                AND AsActivityField.FieldName = ''ProduceDocumentCheckBox''
        )
	)';

    VRESULT := NULL;
	EXECUTESQL ( VSQL1, VRESULT );

END;
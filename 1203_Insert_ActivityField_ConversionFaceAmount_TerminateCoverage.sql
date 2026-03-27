DECLARE 
    VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
  

BEGIN
-- Insert Fieldname ConversionFaceAmount in Transaction TerminateCoverage 
	VSQL1:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
    	SELECT ActivityGUID, ''ConversionFaceAmount'', ''04'', 0, ''CAD''
    	FROM AsActivity
    	WHERE ActivityGUID IN 
			(
				SELECT AsActivity.ActivityGUID FROM AsActivity
				JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
					AND AsTransaction.TransactionName = ''TerminateCoverage''
			)
			AND ActivityGUID NOT IN 
				(
					SELECT AsActivity.ActivityGUID FROM AsActivity
					JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
						AND AsActivityField.FieldName = ''ConversionFaceAmount''
					JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
						AND AsTransaction.TransactionName = ''TerminateCoverage''
				)
    	';

-- Insert FieldName AsFileSource in Transaction UpdateUnderwritingDecision
	VSQL2:= '
    	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
    	SELECT ActivityGUID, ''AsFileSource'', ''02'', ''CUD''
    	FROM AsActivity
    	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
	        AND AsTransaction.TransactionName = ''UpdateUnderwritingDecision''
	    WHERE AsActivity.ActivityGUID NOT IN (
        	SELECT AsActivity.ActivityGUID
        	FROM AsActivity
        	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
	            AND AsTransaction.TransactionName = ''UpdateUnderwritingDecision''
        	JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID
	            AND AsActivityField.FieldName = ''AsFileSource''
	    )';

	VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
    
END;

DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
    
BEGIN 
-- Insert FirstPremiumPaymentMethod in AsPolicyField 
VSQL1:='
	INSERT INTO AsPolicyField (PolicyGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
	SELECT PolicyGUID, ''FirstPremiumPaymentMethod'', ''02'', ''05'', 1, ''AsCodePaymentMethod.PADSD''
    FROM AsPolicy
    WHERE PolicyGUID NOT IN (
		SELECT PolicyGUID 
        FROM AsPolicyField 
        WHERE FieldName = ''FirstPremiumPaymentMethod''
        )';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
    
END;
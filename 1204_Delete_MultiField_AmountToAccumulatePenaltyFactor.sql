DECLARE 
    VSQL1 VARCHAR2(32767);
    VRESULT VARCHAR2(200);
    
BEGIN 
VSQL1:= '
          DELETE FROM AsActivityMultiValueField
		  WHERE FieldName = ''AmountToAccumulatePenaltyFactor''		  
		';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );    
    
END;

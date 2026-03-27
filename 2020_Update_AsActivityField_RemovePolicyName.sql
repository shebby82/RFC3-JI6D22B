SET SERVEROUTPUT ON;

DECLARE
  v_count NUMBER;
BEGIN
    UPDATE AsActivityField set TextValue = NULL WHERE FIELDNAME IN ('PolicyName','UpdatedPolicyName');   
    v_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('ChangePolicyInformationAtActivation updated: ' || v_count);
    COMMIT;
END;
/

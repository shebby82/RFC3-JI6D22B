create or replace FUNCTION update_effective_date (
    u_activityguid IN VARCHAR2,
    u_field_value IN DATE
   
)
RETURN VARCHAR2
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_count NUMBER;
BEGIN

    UPDATE AsActivity
    SET EffectiveDate = u_field_value 
    WHERE ActivityGUID = u_activityguid;   


    v_count := SQL%ROWCOUNT;


    IF v_count > 0 THEN
        COMMIT;  
        RETURN 'SUCCESS';
    ELSE
        ROLLBACK; 
        RETURN 'WARNING: No rows matched the criteria';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; 
        RETURN 'ERROR: ' || SQLERRM;
END update_effective_date;

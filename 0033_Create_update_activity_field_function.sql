create or replace FUNCTION update_activity_field (
    u_activityguid IN VARCHAR2,
    u_field_value IN VARCHAR2,
    u_field_name IN VARCHAR2
)
RETURN VARCHAR2
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_count NUMBER;
BEGIN

    UPDATE AsActivityField
    SET TextValue = u_field_value 
    WHERE ActivityGUID = u_activityguid 
    AND FieldName = u_field_name;


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
END update_activity_field;
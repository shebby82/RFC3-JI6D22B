DECLARE
    v_existing_rows NUMBER := 0;
    v_affected_rows NUMBER := 0;
    v_operation_type VARCHAR2(20);

    v_query_name VARCHAR2(50) := 'GetActivityCounts';
    v_application_name VARCHAR2(50) := 'Modernia';
    v_version_number NUMBER := 1;
    v_query_value VARCHAR2(4000) := 'SELECT SUM(CASE WHEN ActivityGMT >= SYSDATE - 1 THEN 1 ELSE 0 END) AS ActivitiesLastDay, ' ||
                                    'SUM(CASE WHEN ActivityGMT >= SYSDATE - 7 THEN 1 ELSE 0 END) AS ActivitiesLastWeek, ' ||
                                    'SUM(CASE WHEN ActivityGMT >= SYSDATE - 30 THEN 1 ELSE 0 END) AS ActivitiesLastMonth, ' ||
                                    'MAX(ActivityGMT) AS LatestActivityDate ' ||
                                    'FROM AsActivity';
BEGIN
    -- Check if the row already exists
    SELECT COUNT(*)
    INTO v_existing_rows
    FROM AsRestServiceQuery
    WHERE QueryName = v_query_name
      AND ApplicationName = v_application_name
      AND VersionNumber = v_version_number;

    -- Perform INSERT or UPDATE based on existence
    IF v_existing_rows > 0 THEN
        -- Update existing row
        UPDATE AsRestServiceQuery
        SET QueryValue = v_query_value
        WHERE QueryName = v_query_name
          AND ApplicationName = v_application_name
          AND VersionNumber = v_version_number;
        
        v_operation_type := 'updated';
    ELSE
        -- Insert new row
        INSERT INTO AsRestServiceQuery (RestServiceQueryGUID, QueryName, VersionNumber, QueryValue, ApplicationName)
        VALUES (NEWID(), v_query_name, v_version_number, v_query_value, v_application_name);

        v_operation_type := 'inserted';
    END IF;
    
    v_affected_rows := SQL%ROWCOUNT;

    -- Output the operation type and affected rows
    DBMS_OUTPUT.PUT_LINE(v_affected_rows || ' row(s) ' || v_operation_type || '.' );
END;
SET SERVEROUTPUT ON;

DECLARE
  v_count NUMBER;
BEGIN
  UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ApplyApplicationChangesFromPolicy'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ApplyApplicationChangesFromPolicy updated: ' || v_count);

    UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ChangePolicyOwners'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ChangePolicyOwners updated: ' || v_count);

    UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ChangePartyNominativeInformationAtIssue'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ChangePartyNominativeInformationAtIssue updated: ' || v_count);

   UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'IssuePolicy'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('IssuePolicy updated: ' || v_count);

   UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ChangePartyNominativeInformation'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ChangePartyNominativeInformation updated: ' || v_count);

     UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ApplyPolicyChangesFromApplication'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ApplyPolicyChangesFromApplication updated: ' || v_count);
  
     UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ChangePolicyOwnersAtIssue'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ChangePolicyOwnersAtIssue updated: ' || v_count);
  
     UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'AddPolicyInformationToApplication'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('AddPolicyInformationToApplication updated: ' || v_count);
  
     UPDATE AsActivity
    SET xmldata =
        UPDATEXML(
          UPDATEXML(
            UPDATEXML(
              UPDATEXML(
                UPDATEXML(
                  XMLType(xmldata),
                  '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/Old',
                  XMLType('<Old/>')
                ),
                '/Activity/Changes/AsPolicy[@FIELD="PolicyName"]/New',
                XMLType('<New/>')
              ),
              '/Activity/Math/CTPF_PolicyName',
              XMLType('<CTPF_PolicyName/>')
            ),
            '/Activity/Math/ActivityPolicyName',
            XMLType('<ActivityPolicyName/>')
          ),
           '/Activity/Math/ActivityUpdatedPolicyName',
              XMLType('<ActivityUpdatedPolicyName/>')
         ).getClobVal()
    WHERE activityguid IN (
      SELECT a.activityguid
      FROM AsActivity a
      JOIN AsTransaction t ON t.TransactionGUID = a.TransactionGUID
      WHERE t.TransactionName = 'ChangePolicyInformationAtActivation'
      AND a.xmldata IS NOT NULL
    );
  v_count := SQL%ROWCOUNT;
  DBMS_OUTPUT.PUT_LINE('ChangePolicyInformationAtActivation updated: ' || v_count);
  COMMIT;
END;
/

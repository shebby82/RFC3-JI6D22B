DECLARE 
    VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
	VSQL3 VARCHAR2(32767);
	VSQL4 VARCHAR2(32767);
	
    VRESULT VARCHAR2(200);

BEGIN 
/* Add BeneficiaryRelationshipToPolicyOwnerType in the case the transaction AddCoverageRolesAtIssue Adds a Beneficiary */
VSQL1:=	'
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
	WITH RoleFieldValues AS 
	(
		SELECT 
			CoverageIdentifier.TextValue AS CoverageIdentifier,
            Insured.TextValue AS InsuredRoleGUID,
            AsRole.ClientGUID AS BeneficiaryClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue AS FieldValue
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
			AND AsTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
		JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
			AND AsActivityField.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageIdentifier ON CoverageIdentifier.TextValue = AsActivityField.TextValue
			AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageStatus ON CoverageIdentifier.SegmentGUID = CoverageStatus.SegmentGUID
			AND CoverageStatus.FieldName = ''CoverageStatus''
			AND CoverageStatus.TextValue IN (''01'', ''02'', ''08'', ''19'')
		JOIN AsRole ON AsRole.SegmentGUID = CoverageIdentifier.SegmentGUID
			AND AsRole.RoleCode = ''23''
		JOIN AsRoleField ON AsRoleField.RoleGUID = AsRole.RoleGUID
			AND AsRoleField.FieldName LIKE ''BeneficiaryRelationshipToPolicyOwnerType%''
        JOIN AsRoleField Insured ON Insured.RoleGUID = AsRole.RoleGUID
			AND Insured.FieldName = ''Insured''
		GROUP BY CoverageIdentifier.TextValue,
            Insured.TextValue,
            AsRole.ClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue 
	)
	SELECT DISTINCT AsActivity.ActivityGUID, RoleFieldValues.FieldName, ''02'', RoleFieldValues.FieldValue
	FROM AsActivity
	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		AND AsTransaction.TransactionName IN (''AddCoverageRolesAtIssue'')
	JOIN AsActivityField RoleCode ON AsActivity.ActivityGUID = RoleCode.ActivityGUID
		AND RoleCode.FieldName = ''RoleCode''
		AND RoleCode.TextValue = ''23''
	JOIN AsActivityField BeneficiaryInsured ON AsActivity.ActivityGUID = BeneficiaryInsured.ActivityGUID
		AND BeneficiaryInsured.FieldName = ''BeneficiaryInsured''
    JOIN AsActivityField RoleClientGUID ON AsActivity.ActivityGUID = RoleClientGUID.ActivityGUID
		AND RoleClientGUID.FieldName = ''RoleClientGUID''
	JOIN AsActivitySpawn ON AsActivitySpawn.ActivityGUID = AsActivity.ActivityGUID
	JOIN AsActivity SpawnedBy ON SpawnedBy.ActivityGUID = AsActivitySpawn.SpawnedByGUID
	JOIN AsTransaction SpawnByTransaction ON SpawnByTransaction.TransactionGUID = SpawnedBy.TransactionGUID
		AND SpawnByTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
	JOIN AsActivityField CoverageIdentifier ON SpawnedBy.ActivityGUID = CoverageIdentifier.ActivityGUID
		AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
	JOIN RoleFieldValues ON RoleFieldValues.CoverageIdentifier = CoverageIdentifier.TextValue
        AND RoleFieldValues.InsuredRoleGUID = BeneficiaryInsured.TextValue
        AND RoleFieldValues.BeneficiaryClientGUID = RoleClientGUID.TextValue
	JOIN AsPolicy ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		AND AsPolicy.StatusCode != ''12''
	WHERE AsActivity.ActivityGUID NOT IN 
		(
		SELECT DISTINCT(AsActivity.ActivityGUID)
		FROM AsActivity
		JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
			AND AsTransaction.TransactionName = ''AddCoverageRolesAtIssue''
		JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID 
			AND AsActivityField.FieldName LIKE ''BeneficiaryRelationshipToPolicyOwnerType%'' 
		)
	ORDER BY AsActivity.ActivityGUID, RoleFieldValues.FieldName
	';
    
/* Add BeneficiaryPolicyOwnerPolicyPartyID in the case the transaction AddCoverageRolesAtIssue Adds a Beneficiary */
VSQL2:=	'
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
	WITH RoleFieldValues AS
	(
		SELECT 
			CoverageIdentifier.TextValue AS CoverageIdentifier,
            Insured.TextValue AS InsuredRoleGUID,
            AsRole.ClientGUID AS BeneficiaryClientGUID,
			CONCAT(''Beneficiary'', AsRoleField.FieldName) AS FieldName,
			AsRoleField.TextValue AS FieldValue
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
			AND AsTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
		JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
			AND AsActivityField.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageIdentifier ON CoverageIdentifier.TextValue = AsActivityField.TextValue
			AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageStatus ON CoverageIdentifier.SegmentGUID = CoverageStatus.SegmentGUID
			AND CoverageStatus.FieldName = ''CoverageStatus''
			AND CoverageStatus.TextValue IN (''01'', ''02'', ''08'', ''19'')
		JOIN AsRole ON AsRole.SegmentGUID = CoverageIdentifier.SegmentGUID
			AND AsRole.RoleCode = ''23''
		JOIN AsRoleField ON AsRoleField.RoleGUID = AsRole.RoleGUID
			AND AsRoleField.FieldName LIKE ''PolicyOwnerPolicyPartyID%''
        JOIN AsRoleField Insured ON Insured.RoleGUID = AsRole.RoleGUID
			AND Insured.FieldName = ''Insured''
		GROUP BY CoverageIdentifier.TextValue,
            Insured.TextValue,
            AsRole.ClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue 
	)
	SELECT DISTINCT AsActivity.ActivityGUID, RoleFieldValues.FieldName, ''02'', RoleFieldValues.FieldValue
	FROM AsActivity
	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		AND AsTransaction.TransactionName IN (''AddCoverageRolesAtIssue'')
	JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
		AND AsActivityField.FieldName = ''RoleCode''
		AND AsActivityField.TextValue = ''23''
	JOIN AsActivityField BeneficiaryInsured ON AsActivity.ActivityGUID = BeneficiaryInsured.ActivityGUID
		AND BeneficiaryInsured.FieldName = ''BeneficiaryInsured''
    JOIN AsActivityField RoleClientGUID ON AsActivity.ActivityGUID = RoleClientGUID.ActivityGUID
		AND RoleClientGUID.FieldName = ''RoleClientGUID''
	JOIN AsActivitySpawn ON AsActivitySpawn.ActivityGUID = AsActivity.ActivityGUID
	JOIN AsActivity SpawnedBy ON SpawnedBy.ActivityGUID = AsActivitySpawn.SpawnedByGUID
	JOIN AsTransaction SpawnByTransaction ON SpawnByTransaction.TransactionGUID = SpawnedBy.TransactionGUID
		AND SpawnByTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
	JOIN AsActivityField CoverageIdentifier ON SpawnedBy.ActivityGUID = CoverageIdentifier.ActivityGUID
		AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
	JOIN RoleFieldValues ON RoleFieldValues.CoverageIdentifier = CoverageIdentifier.TextValue
        AND RoleFieldValues.InsuredRoleGUID = BeneficiaryInsured.TextValue
        AND RoleFieldValues.BeneficiaryClientGUID = RoleClientGUID.TextValue
	JOIN AsPolicy ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		AND AsPolicy.StatusCode != ''12''
	WHERE AsActivity.ActivityGUID NOT IN 
		(
		SELECT DISTINCT(AsActivity.ActivityGUID)
		FROM AsActivity
		JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID 
			AND AsTransaction.TransactionName = ''AddCoverageRolesAtIssue''
		JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ACTIVITYGUID
			AND AsActivityField.FieldName LIKE ''BeneficiaryPolicyOwnerPolicyPartyID%''
		)
	ORDER BY AsActivity.ActivityGUID, RoleFieldValues.FieldName
	';
    
/* Add ContingentBeneficiaryRelationshipToPolicyOwnerType in the case the transaction AddCoverageRolesAtIssue Adds a ContingentBeneficiary */
VSQL3:=	'
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
	WITH RoleFieldValues AS 
	(
		SELECT 
			CoverageIdentifier.TextValue AS CoverageIdentifier,
            BeneficiaryRoleGUID.TextValue AS BeneficiaryRoleGUID,
            AsRole.ClientGUID AS ContingentBeneficiaryClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue AS FieldValue
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
			AND AsTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
		JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
			AND AsActivityField.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageIdentifier ON CoverageIdentifier.TextValue = AsActivityField.TextValue
			AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageStatus ON CoverageIdentifier.SegmentGUID = CoverageStatus.SegmentGUID
			AND CoverageStatus.FieldName = ''CoverageStatus''
			AND CoverageStatus.TextValue IN (''01'', ''02'', ''08'', ''19'')
		JOIN AsRole ON AsRole.SegmentGUID = CoverageIdentifier.SegmentGUID
			AND AsRole.RoleCode = ''24''
		JOIN AsRoleField ON AsRoleField.RoleGUID = AsRole.RoleGUID
			AND AsRoleField.FieldName LIKE ''ContingentBeneficiaryRelationshipToPolicyOwnerType%''
        JOIN AsRoleField BeneficiaryRoleGUID ON BeneficiaryRoleGUID.RoleGUID = AsRole.RoleGUID
			AND BeneficiaryRoleGUID.FieldName = ''BeneficiaryRoleGUID''
		GROUP BY CoverageIdentifier.TextValue,
            BeneficiaryRoleGUID.TextValue,
            AsRole.ClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue 
	)
	SELECT DISTINCT AsActivity.ActivityGUID, RoleFieldValues.FieldName, ''02'', RoleFieldValues.FieldValue
    FROM AsActivity
	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		AND AsTransaction.TransactionName IN (''AddCoverageRolesAtIssue'')
    JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
        AND AsActivityField.FieldName = ''RoleCode''
        AND AsActivityField.TextValue = ''24''
    JOIN AsActivityField ContingentBeneficiaryBeneficiaryRoleGUID ON AsActivity.ActivityGUID = ContingentBeneficiaryBeneficiaryRoleGUID.ActivityGUID
        AND ContingentBeneficiaryBeneficiaryRoleGUID.FieldName = ''ContingentBeneficiaryBeneficiaryRoleGUID''
    JOIN AsActivityField RoleClientGUID ON AsActivity.ActivityGUID = RoleClientGUID.ActivityGUID
		AND RoleClientGUID.FieldName = ''RoleClientGUID''
    JOIN AsActivitySpawn ON AsActivitySpawn.ActivityGUID = AsActivity.ActivityGUID
    JOIN AsActivity SpawnedBy ON SpawnedBy.ActivityGUID = AsActivitySpawn.SpawnedByGUID
    JOIN AsTransaction SpawnByTransaction ON SpawnByTransaction.TransactionGUID = SpawnedBy.TransactionGUID
        AND SpawnByTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
    JOIN AsActivityField CoverageIdentifier ON SpawnedBy.ActivityGUID = CoverageIdentifier.ActivityGUID
        AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
    JOIN RoleFieldValues ON RoleFieldValues.CoverageIdentifier = CoverageIdentifier.TextValue
        AND RoleFieldValues.BeneficiaryRoleGUID = ContingentBeneficiaryBeneficiaryRoleGUID.TextValue
        AND RoleFieldValues.ContingentBeneficiaryClientGUID = RoleClientGUID.TextValue
	JOIN AsPolicy ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		AND AsPolicy.StatusCode != ''12''
    WHERE AsActivity.ActivityGUID NOT IN 
    	(
        SELECT DISTINCT(AsActivity.ActivityGUID)
		FROM AsActivity
        JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID 
			AND AsTransaction.TransactionName = ''AddCoverageRolesAtIssue''
		JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ACTIVITYGUID
			AND AsActivityField.FieldName LIKE ''ContingentBeneficiaryRelationshipToPolicyOwnerType%''
    	)
    ORDER BY AsActivity.ActivityGUID, RoleFieldValues.FieldName
	';
    
/* Add ContingentBeneficiaryPolicyOwnerPolicyPartyID in the case the transaction AddCoverageRolesAtIssue Adds a ContingentBeneficiary */
VSQL4:= '
	INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
	WITH RoleFieldValues AS
	(
		SELECT 
			CoverageIdentifier.TextValue AS CoverageIdentifier,
            BeneficiaryRoleGUID.TextValue AS BeneficiaryRoleGUID,
            AsRole.ClientGUID AS ContingentBeneficiaryClientGUID,
			CONCAT(''ContingentBeneficiary'', AsRoleField.FieldName) AS FieldName,
			AsRoleField.TextValue AS FieldValue
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
			AND AsTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
		JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
			AND AsActivityField.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageIdentifier ON CoverageIdentifier.TextValue = AsActivityField.TextValue
			AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
		JOIN AsSegmentField CoverageStatus ON CoverageIdentifier.SegmentGUID = CoverageStatus.SegmentGUID
			AND CoverageStatus.FieldName = ''CoverageStatus''
			AND CoverageStatus.TextValue IN (''01'', ''02'', ''08'', ''19'')
		JOIN AsRole ON AsRole.SegmentGUID = CoverageIdentifier.SegmentGUID
			AND AsRole.RoleCode = ''24''
		JOIN AsRoleField ON AsRoleField.RoleGUID = AsRole.RoleGUID
			AND AsRoleField.FieldName LIKE ''PolicyOwnerPolicyPartyID%''
        JOIN AsRoleField BeneficiaryRoleGUID ON BeneficiaryRoleGUID.RoleGUID = AsRole.RoleGUID
			AND BeneficiaryRoleGUID.FieldName = ''BeneficiaryRoleGUID''
		GROUP BY CoverageIdentifier.TextValue,
            BeneficiaryRoleGUID.TextValue,
            AsRole.ClientGUID,
			AsRoleField.FieldName,
			AsRoleField.TextValue 
	)
	SELECT DISTINCT AsActivity.ActivityGUID, RoleFieldValues.FieldName, ''02'', RoleFieldValues.FieldValue
    FROM AsActivity
	JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
		AND AsTransaction.TransactionName IN (''AddCoverageRolesAtIssue'')
    JOIN AsActivityField ON AsActivity.ActivityGUID = AsActivityField.ActivityGUID
        AND AsActivityField.FieldName = ''RoleCode''
        AND AsActivityField.TextValue = ''24''
    JOIN AsActivityField ContingentBeneficiaryBeneficiaryRoleGUID ON AsActivity.ActivityGUID = ContingentBeneficiaryBeneficiaryRoleGUID.ActivityGUID
        AND ContingentBeneficiaryBeneficiaryRoleGUID.FieldName = ''ContingentBeneficiaryBeneficiaryRoleGUID''
    JOIN AsActivityField RoleClientGUID ON AsActivity.ActivityGUID = RoleClientGUID.ActivityGUID
		AND RoleClientGUID.FieldName = ''RoleClientGUID''
    JOIN AsActivitySpawn ON AsActivitySpawn.ActivityGUID = AsActivity.ActivityGUID
    JOIN AsActivity SpawnedBy ON SpawnedBy.ActivityGUID = AsActivitySpawn.SpawnedByGUID
    JOIN AsTransaction SpawnByTransaction ON SpawnByTransaction.TransactionGUID = SpawnedBy.TransactionGUID
        AND SpawnByTransaction.TransactionName IN (''ApplyAddCoverageAtIssue'', ''AddCoverageAtIssue'')
    JOIN AsActivityField CoverageIdentifier ON SpawnedBy.ActivityGUID = CoverageIdentifier.ActivityGUID
        AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
    JOIN RoleFieldValues ON RoleFieldValues.CoverageIdentifier = CoverageIdentifier.TextValue
        AND RoleFieldValues.BeneficiaryRoleGUID = ContingentBeneficiaryBeneficiaryRoleGUID.TextValue
        AND RoleFieldValues.ContingentBeneficiaryClientGUID = RoleClientGUID.TextValue
	JOIN AsPolicy ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		AND AsPolicy.StatusCode != ''12''
    WHERE AsActivity.ActivityGUID NOT IN 
    	(
        SELECT DISTINCT(AsActivity.ActivityGUID)
		FROM AsActivity
        JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID 
            AND AsTransaction.TransactionName = ''AddCoverageRolesAtIssue''
		JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ACTIVITYGUID
			AND AsActivityField.FieldName LIKE ''ContingentBeneficiaryPolicyOwnerPolicyPartyID%''
    	)
    ORDER BY AsActivity.ActivityGUID, RoleFieldValues.FieldName
	';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
	EXECUTESQL ( VSQL3, VRESULT );
	EXECUTESQL ( VSQL4, VRESULT );
	
END;
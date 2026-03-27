DECLARE 
    VSQL1 VARCHAR2(32767);
    VSQL2 VARCHAR2(32767);
    VRESULT VARCHAR2(200);

BEGIN
	-- Insert RoleField ReinsuranceAlphaSplitKey on Insureds
	VSQL1:=
		'
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue)
		SELECT AsRole.RoleGUID, ''ReinsuranceAlphaSplitKey'', ''02'', ''''
		FROM AsRole
		WHERE AsRole.RoleCode = ''37''
			AND AsRole.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceAlphaSplitKey''
			)
		';

	-- Insert ActivityField InsuredReinsuranceAlphaSplitKey on ApplyCoverageRolesChangesFromApplication, AddRolesOnCoverage, AddCoverageRoles and AddCoverageRolesAtIssue Activities
	VSQL2:=
		'
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
		SELECT AsActivity.ActivityGUID, ''InsuredReinsuranceAlphaSplitKey'', ''02'', ''''
		FROM AsActivity
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID
			AND AsTransaction.TransactionName IN (''ApplyCoverageRolesChangesFromApplication'', ''AddRolesOnCoverage'', ''AddCoverageRoles'', ''AddCoverageRolesAtIssue'')
		WHERE AsActivity.ActivityGUID NOT IN (
			SELECT ActivityGUID 
			FROM AsActivityField 
			WHERE FieldName = ''InsuredReinsuranceAlphaSplitKey''
			)
		';

VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
    EXECUTESQL ( VSQL2, VRESULT );

END;
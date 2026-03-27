DECLARE
	VSQL1 VARCHAR2(32767);
	VSQL2 VARCHAR2(32767);
	VSQL3 VARCHAR2(32767);
	VSQL4 VARCHAR2(32767);
	VRESULT VARCHAR2(200);

BEGIN
	-- Insert ActivityField PolicyPartyID in activities ChangeCoverageExtraPremium and ChangeCoverageExtraPremiumAtIssue
	VSQL1:= '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
		SELECT AsActivity.ActivityGUID, ''PolicyPartyID'',''02'', PolicyPartyID.TextValue
		FROM AsPolicy
		JOIN AsActivity ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID 
			AND TransactionName IN (''ChangeCoverageExtraPremium'', ''ChangeCoverageExtraPremiumAtIssue'')
		JOIN AsActivityField CoverageIdentifier ON CoverageIdentifier.ActivityGUID=AsActivity.ActivityGUID 
			AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
		JOIN AsRole ON AsRole.SegmentGUID = CoverageIdentifier.TextValue 
			AND AsRole.RoleCode = ''37''
			AND AsRole.StatusCode = ''01''
		JOIN AsClientField PolicyPartyID ON PolicyPartyID.ClientGUID = AsRole.ClientGUID 
			AND PolicyPartyID.FieldName = ''PolicyPartyID''
		WHERE AsActivity.ActivityGUID NOT IN 
			(
				SELECT ActivityGUID 
				FROM AsActivityField 
				WHERE FieldName = ''PolicyPartyID''
			)
		   ';
	
	-- Insert ActivityField CoverageExtraPremiumAmount in activities ChangeCoverageExtraPremium and ChangeCoverageExtraPremiumAtIssue and AddCoverageExtraPremium
	VSQL2:='
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, IntValue)
		SELECT AsActivity.ActivityGUID, ''CoverageExtraPremiumAmount'', ''04'', 0
		FROM AsPolicy
		JOIN AsActivity ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID 
			AND TransactionName IN (''ChangeCoverageExtraPremium'', ''ChangeCoverageExtraPremiumAtIssue'', ''AddCoverageExtraPremium'')
		WHERE AsActivity.ActivityGUID NOT IN 
			(
				SELECT ActivityGUID 
				FROM AsActivityField 
				WHERE FieldName = ''CoverageExtraPremiumAmount''
			)
		   ';
		   
	-- Insert ActivityField CoverageExtraPremiumDuration in activities ChangeCoverageExtraPremium and ChangeCoverageExtraPremiumAtIssue and AddCoverageExtraPremium
	VSQL3:='
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, IntValue)
		SELECT AsActivity.ActivityGUID, ''CoverageExtraPremiumDuration'',''03'', 0
		FROM AsPolicy
		JOIN AsActivity ON AsActivity.PolicyGUID = AsPolicy.PolicyGUID
		JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID 
			AND TransactionName IN (''ChangeCoverageExtraPremium'', ''ChangeCoverageExtraPremiumAtIssue'', ''AddCoverageExtraPremium'')
		WHERE AsActivity.ActivityGUID NOT IN 
			(
				SELECT ActivityGUID 
				FROM AsActivityField 
				WHERE FieldName = ''CoverageExtraPremiumDuration''
			)
		   ';	
		   
	-- Insert ActivityField PartyID in activities AddCoverageExtraPremium
		VSQL4:='
			INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
			SELECT AsActivity.ActivityGUID, ''PartyID'', ''02'', PartyID.TextValue
			FROM AsPolicy
			JOIN AsActivity ON AsActivity.PolicyGUID=AsPolicy.PolicyGUID
			JOIN AsTransaction ON AsTransaction.TransactionGUID = AsActivity.TransactionGUID 
				AND TransactionName = ''AddCoverageExtraPremium''
			JOIN AsActivityField CoverageIdentifier ON CoverageIdentifier.ActivityGUID = AsActivity.ActivityGUID 
				AND CoverageIdentifier.FieldName = ''CoverageIdentifier''
			JOIN AsSegment ON AsSegment.PolicyGUID = AsPolicy.PolicyGUID
			JOIN AsSegmentField ON AsSegmentField.SegmentGUID = AsSegment.SegmentGUID 
				AND AsSegmentField.FieldName = ''CoverageIdentifier''
				AND AsSegmentField.TextValue = CoverageIdentifier.TextValue
			JOIN AsRole ON AsRole.SegmentGUID = AsSegment.SegmentGUID 
			     AND AsRole.RoleCode = ''37''
			     AND AsRole.StatusCode = ''01''
			JOIN AsClientField PartyID ON PartyID.ClientGUID = AsRole.ClientGUID 
				AND PartyID.FieldName = ''PartyID''
			WHERE AsActivity.ActivityGUID NOT IN 
				(
					SELECT ActivityGUID 
					FROM AsActivityField 
					WHERE FieldName = ''PartyID''
				)
			   ';		   
		   
    VRESULT := NULL;
	
	EXECUTESQL ( VSQL1, VRESULT );
	EXECUTESQL ( VSQL2, VRESULT );
	EXECUTESQL ( VSQL3, VRESULT );
	EXECUTESQL ( VSQL4, VRESULT );
END;
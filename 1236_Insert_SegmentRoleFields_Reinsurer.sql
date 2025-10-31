DECLARE 

    VSQL1 VARCHAR2(32767);
    VSQL2 VARCHAR2(32767);
    VSQL3 VARCHAR2(32767);
    VSQL4 VARCHAR2(32767);
    VSQL5 VARCHAR2(32767);
    VSQL6 VARCHAR2(32767);
    VSQL7 VARCHAR2(32767);
    VSQL8 VARCHAR2(32767);
    VSQL9 VARCHAR2(32767);
    VSQL10 VARCHAR2(32767);
    VSQL11 VARCHAR2(32767);
    VSQL12 VARCHAR2(32767);
    VSQL13 VARCHAR2(32767);
    VSQL14 VARCHAR2(32767);
    VSQL15 VARCHAR2(32767);
    VSQL16 VARCHAR2(32767);
    VSQL17 VARCHAR2(32767);
    VSQL18 VARCHAR2(32767);
    VSQL19 VARCHAR2(32767);
    VSQL20 VARCHAR2(32767);
    VSQL21 VARCHAR2(32767);
    VSQL22 VARCHAR2(32767);
    VSQL23 VARCHAR2(32767);
    VSQL24 VARCHAR2(32767);
    VSQL25 VARCHAR2(32767);
    VSQL26 VARCHAR2(32767);
    VSQL27 VARCHAR2(32767);
    VSQL28 VARCHAR2(32767);
    VRESULT VARCHAR2(200);

BEGIN
	-- Insert RoleField ReinsuranceEffectiveDate on SegmentRole Reinsurer 
	VSQL1:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceEffectiveDate'', ''01'', AsSegmentField.DateValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceEffectiveDate''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceEffectiveDate''
				)
		';

    -- Insert RoleField ReinsurancePremiumNet on SegmentRole Reinsurer 
	VSQL2:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsurancePremiumNet'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsurancePremiumNet''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsurancePremiumNet''
				)
		';

    -- Insert RoleField ReinsuranceCoverageYear on SegmentRole Reinsurer 
	VSQL3:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, IntValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceCoverageYear'', ''03'', AsSegmentField.IntValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceCoverageYear''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceCoverageYear''
				)
		';

    -- Insert RoleField ReinsurancePremiumTax on SegmentRole Reinsurer 
	VSQL4:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode ,FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsurancePremiumTax'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsurancePremiumTax''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsurancePremiumTax''
				)
		';
        
    -- Insert RoleField ReinsuranceGrossAnnualBasicPremium on SegmentRole Reinsurer 
	VSQL5:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceGrossAnnualBasicPremium'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceGrossAnnualBasicPremium''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceGrossAnnualBasicPremium''
				)
		';
        
    -- Insert RoleField ReinsuranceExtraPremiumPercentage on SegmentRole Reinsurer 
	VSQL6:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceExtraPremiumPercentage'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceExtraPremiumPercentage''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceExtraPremiumPercentage''
				)
		';
        
    -- Insert RoleField ReinsurancePremiumGross on SegmentRole Reinsurer 
	VSQL7:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsurancePremiumGross'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsurancePremiumGross''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsurancePremiumGross''
				)
		';           
        
    -- Insert RoleField CessionMode on SegmentRole Reinsurer 
	VSQL8:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Reinsurer.RoleGUID, ''CessionMode'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''CessionMode''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''CessionMode''
				)
		';         

    -- Insert RoleField ReinsuranceType on SegmentRole Reinsurer 
	VSQL9:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceType'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceType''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceType''
				)
		'; 
        
    -- Insert RoleField ReinsuranceCededFaceAmount on SegmentRole Reinsurer 
	VSQL10:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceCededFaceAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceCededFaceAmount''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceCededFaceAmount''
				)
		';  
        
    -- Insert RoleField ReinsuranceStopped on SegmentRole Reinsurer 
	VSQL11:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceStopped'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceStopped''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceStopped''
				)
		';
	-- Insert RoleField ReinsuranceStoppedDate on SegmentRole Reinsurer 
	VSQL12:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceStoppedDate'', ''01'', AsSegmentField.DateValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceStoppedDate''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceStoppedDate''
				)
		';  
        
    -- Insert RoleField ReinsuranceNAARRule on SegmentRole Reinsurer 
	VSQL13:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceNAARRule'', ''02'', AsSegmentField.TextValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceNAARRule''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceNAARRule''
				)
		';   
        
    -- Insert RoleField ReinsuranceNAARAmount on SegmentRole Reinsurer 
	VSQL14:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceNAARAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceNAARAmount''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceNAARAmount''
				)
		';    
        
    -- Insert RoleField RetainedAmount on SegmentRole Reinsurer 
	VSQL15:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''RetainedAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''RetainedAmount''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''RetainedAmount''
				)
		';      
        
	-- Insert RoleField RiskCessionDate on SegmentRole Reinsurer 
	VSQL16:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, DateValue)
		SELECT Reinsurer.RoleGUID, ''RiskCessionDate'', ''01'', AsSegmentField.DateValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''RiskCessionDate''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''RiskCessionDate''
				)
		';   
        
    -- Insert RoleField ReinsuranceAge on SegmentRole Reinsurer 
	VSQL17:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode,IntValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceAge'', ''03'', AsSegmentField.IntValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceAge''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceAge''
				)
		';  
    -- Insert RoleField ReinsuranceGender on SegmentRole Reinsurer 
	VSQL18:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceGender'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceGender''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceGender''
				)
		';      
               
    -- Insert RoleField ReinsuranceTobaccoUse on SegmentRole Reinsurer 
	VSQL19:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceTobaccoUse'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceTobaccoUse''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceTobaccoUse''
				)
		'; 
        
    -- Insert RoleField ReinsuranceInsuredName on SegmentRole Reinsurer 
	VSQL20:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceInsuredName'', ''02'', AsSegmentField.TextValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceInsuredName''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceInsuredName''
				)
		'; 
        
    -- Insert RoleField ReinsuranceAllowancePremiumPercentage on SegmentRole Reinsurer 
	VSQL21:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceAllowancePremiumPercentage'', ''04'', AsSegmentField.FloatValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceAllowancePremiumPercentage''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceAllowancePremiumPercentage''
				)
		';  
        
    -- Insert RoleField ReinsuranceAllowancePremiumAmount on SegmentRole Reinsurer 
	VSQL22:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceAllowancePremiumAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceAllowancePremiumAmount''
		WHERE Reinsurer.RoleCode = ''97''
			AND Reinsurer.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceAllowancePremiumAmount''
				)
		'; 
        
    -- Insert RoleField ReinsuranceExtraPremiumInPercentageAllowancePercentage on SegmentRole Reinsurer 
	VSQL23:=
		'
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceExtraPremiumInPercentageAllowancePercentage'', ''04'', AsSegmentField.FloatValue
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceExtraPremiumInPercentageAllowancePercentage''
		WHERE Reinsurer.RoleCode = ''97''
		AND Reinsurer.RoleGUID NOT IN (
			SELECT RoleGUID 
			FROM AsRoleField 
			WHERE FieldName = ''ReinsuranceExtraPremiumInPercentageAllowancePercentage''
			)
		';        

    -- Insert RoleField ReinsurancePercentageExtraPremiumAllowanceAmount on SegmentRole Reinsurer 
	VSQL24:=
		'
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsurancePercentageExtraPremiumAllowanceAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsurancePercentageExtraPremiumAllowanceAmount''
		WHERE Reinsurer.RoleCode = ''97''
		AND Reinsurer.RoleGUID NOT IN (
			SELECT RoleGUID 
			FROM AsRoleField 
			WHERE FieldName = ''ReinsurancePercentageExtraPremiumAllowanceAmount''
			)
		'; 
        
    -- Insert RoleField ReinsuranceAllowanceTotalAmount on SegmentRole Reinsurer 
	VSQL25:=
		'
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, FloatValue, CurrencyCode)
		SELECT Reinsurer.RoleGUID, ''ReinsuranceAllowanceTotalAmount'', ''04'', AsSegmentField.FloatValue, AsSegmentField.CurrencyCode
		FROM AsRole Reinsurer
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Reinsurer.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceAllowanceTotalAmount''
		WHERE Reinsurer.RoleCode = ''97''
		AND Reinsurer.RoleGUID NOT IN (
			SELECT RoleGUID 
			FROM AsRoleField 
			WHERE FieldName = ''ReinsuranceAllowanceTotalAmount''
			)
		';

    -- Insert RoleField ReinsuranceForcedCessionMode on SegmentRole Insured
	VSQL26:='
		INSERT INTO AsRoleField (RoleGUID, FieldName, FieldTypeCode, TextValue, OptionTextFlag, OptionText)
		SELECT Insured.RoleGUID, ''ReinsuranceForcedCessionMode'', ''02'', AsSegmentField.TextValue, AsSegmentField.OptionTextFlag, AsSegmentField.OptionText
		FROM AsRole Insured
		JOIN AsSegmentField ON AsSegmentField.SegmentGUID = Insured.SegmentGUID
            AND AsSegmentField.FieldName = ''ReinsuranceForcedCessionMode''
		WHERE Insured.RoleCode = ''37''
			AND Insured.RoleGUID NOT IN (
				SELECT RoleGUID 
				FROM AsRoleField 
				WHERE FieldName = ''ReinsuranceForcedCessionMode''
				)
		';
        
    -- Insert ActivityField InsuredRoleGUID on Reinsurance Activities
    VSQL27:=
        '
		INSERT INTO AsActivityField (ActivityGUID, FieldName, FieldTypeCode, TextValue)
        SELECT AsActivity.ActivityGUID, ''InsuredRoleGUID'', ''02'', Insured.RoleGUID
        FROM AsActivity
        JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
            AND AsTransaction.TransactionName IN (''ReinsuranceInitiateConvertRiskCession'',''ReinsuranceInitiateRiskCession'',''ReinsuranceRenewRiskCession'',''ReinsuranceRestartRiskCession'',''ReinsuranceAdjustRiskCession'',''ReinsuranceStopRiskCession'',''ReinsuranceClaimCededRisk'')
        JOIN AsActivityField ON AsActivityField.ActivityGUID = AsActivity.ActivityGUID AND AsActivityField.FieldName = ''ReinsuranceSegmentGUID''
        JOIN AsSegment ON AsSegment.SegmentGUID = AsActivityField.TextValue
        JOIN ( SELECT SegmentGUID, MAX(RoleGUID) AS RoleGUID
            FROM AsRole
            WHERE RoleCode = ''37''
            AND SegmentGUID IS NOT NULL
            AND StatusCode = ''01''
            GROUP BY SegmentGUID
		) Insured ON Insured.SegmentGUID = AsSegment.SegmentGUID
        WHERE AsActivity.ActivityGUID NOT IN (
            SELECT ActivityGUID
            FROM AsActivityField 
            WHERE FieldName = ''InsuredRoleGUID''
            ) 
		';
		
		-- Insert AsActivityMultiValueField InsuredPartyID on ProcessApplicationUnderwritingDecision Activities
    VSQL28:=
        '
		INSERT INTO AsActivityMultiValueField (ActivityGUID, FieldName, FieldIndex, FieldTypeCode, TextValue)
        SELECT AsActivity.ActivityGUID, ''InsuredPartyID'', AsActivityMultiValueField.FieldIndex, ''02'', AsClientField.TextValue
        FROM AsActivity
        JOIN AsTransaction ON AsActivity.TransactionGUID = AsTransaction.TransactionGUID
            AND AsTransaction.TransactionName = ''ProcessApplicationUnderwritingDecision''
        JOIN AsActivityMultiValueField ON AsActivityMultiValueField.ActivityGUID = AsActivity.ActivityGUID
            AND AsActivityMultiValueField.FieldName = ''CoverageIdentifier''
        JOIN AsSegment ON AsSegment.SegmentGUID = AsActivityMultiValueField.TextValue
        JOIN ( SELECT SegmentGUID, MAX(ClientGUID) AS ClientGUID
            FROM AsRole
            WHERE RoleCode = ''37''
            AND SegmentGUID IS NOT NULL
            AND StatusCode = ''01''
            GROUP BY SegmentGUID
		) Insured ON Insured.SegmentGUID = AsSegment.SegmentGUID
        JOIN AsClientField ON AsClientField.ClientGUID = Insured.ClientGUID
            AND AsClientField.FieldName = ''PartyID''
        WHERE AsActivityMultiValueField.ActivityGUID NOT IN (
            SELECT ActivityGUID
            FROM AsActivityMultiValueField 
            WHERE FieldName = ''InsuredPartyID''
            ) 
		';

    VRESULT := NULL;

    EXECUTESQL ( VSQL1, VRESULT );
    EXECUTESQL ( VSQL2, VRESULT );
    EXECUTESQL ( VSQL3, VRESULT );
    EXECUTESQL ( VSQL4, VRESULT );
    EXECUTESQL ( VSQL5, VRESULT );
    EXECUTESQL ( VSQL6, VRESULT );
    EXECUTESQL ( VSQL7, VRESULT );
    EXECUTESQL ( VSQL8, VRESULT );
    EXECUTESQL ( VSQL9, VRESULT );
    EXECUTESQL ( VSQL10, VRESULT );
    EXECUTESQL ( VSQL11, VRESULT );
    EXECUTESQL ( VSQL12, VRESULT );
    EXECUTESQL ( VSQL13, VRESULT );
    EXECUTESQL ( VSQL14, VRESULT );
    EXECUTESQL ( VSQL15, VRESULT );
    EXECUTESQL ( VSQL16, VRESULT );
    EXECUTESQL ( VSQL17, VRESULT );
    EXECUTESQL ( VSQL18, VRESULT );
    EXECUTESQL ( VSQL19, VRESULT );
    EXECUTESQL ( VSQL20, VRESULT );
    EXECUTESQL ( VSQL21, VRESULT );
    EXECUTESQL ( VSQL22, VRESULT );
    EXECUTESQL ( VSQL23, VRESULT );
    EXECUTESQL ( VSQL24, VRESULT );
    EXECUTESQL ( VSQL25, VRESULT );
    EXECUTESQL ( VSQL26, VRESULT );
    EXECUTESQL ( VSQL27, VRESULT );
    EXECUTESQL ( VSQL28, VRESULT );
END;

DECLARE 
  VSQL1 VARCHAR2(32767);
  VSQL2 VARCHAR2(32767);

  VRESULT VARCHAR2(32767);

BEGIN 
VSQL1 := 'DELETE FROM AsSegmentField WHERE FieldName IN (
    ''ReinsuranceEffectiveDate'',''ReinsurancePremiumNet'',''ReinsuranceCoverageYear'',''ReinsurancePremiumTax'',''ReinsuranceGrossAnnualBasicPremium'',
    ''ReinsuranceExtraPremiumPercentage'',''ReinsurancePremiumGross'',''ReinsurerName'',''ReinsurerNumber'',''ReinsuranceForcedCessionMode'',
    ''CessionMode'',''ReinsuranceType'',''ReinsuranceCededFaceAmount'',''ReinsuranceStopped'',''ReinsuranceStoppedDate'',
    ''ReinsuranceNAARRule'',''ReinsuranceNAARAmount'',''RetainedAmount'',''RiskCessionDate'',''CededPercentage'',''ReinsuranceAge'',
    ''ReinsuranceGender'',''ReinsuranceTobaccoUse'',''ReinsuranceInsuredName'',''ReinsuranceAllowancePremiumPercentage'',''ReinsuranceAllowancePremiumAmount'',
    ''ReinsuranceExtraPremiumInPercentageAllowancePercentage'',''ReinsurancePercentageExtraPremiumAllowanceAmount'',''ReinsuranceAllowanceTotalAmount'')';
VSQL2 := 'DELETE FROM AsRoleField WHERE FieldName IN (
    ''ClaimReinsurancePremium'',''ReinsuranceRateTableName'',''ReinsuranceRateFactorTableName'',''ReinsuranceRateFactorValueAtIssue'',''ReinsuranceRateFactorValueAtRenewal'',
    ''ReinsuranceRateFactorAge'')';

VRESULT := NULL;

  EXECUTESQL ( VSQL1, VRESULT );
  EXECUTESQL ( VSQL2, VRESULT );
  
  

END; 
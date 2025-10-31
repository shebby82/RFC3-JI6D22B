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
	VSQL29 VARCHAR2(32767);
	VSQL30 VARCHAR2(32767);
	VSQL31 VARCHAR2(32767);
	VSQL32 VARCHAR2(32767);
	VSQL33 VARCHAR2(32767);
	VSQL34 VARCHAR2(32767);
	
	
	VRESULT VARCHAR2(32767);

BEGIN 
	-- Delete Reinsurers
	VSQL1 := '
		DELETE FROM AsRole
		WHERE ClientGUID IN (
			SELECT ClientGUID FROM AsClient WHERE CompanyName IN (''Ultra Re'', ''Munich Reinsurance Company'', ''Optimum Reinsurance Company'', ''Partner Reinsurance Company'', ''RGA Reinsurance Company'', ''SCOR Reinsurance Company'')
			)
			AND RoleCode = ''02''
		';

	VSQL2 := '
		DELETE FROM AsClientField
		WHERE ClientGUID IN (
			SELECT ClientGUID FROM AsClient WHERE CompanyName IN (''Ultra Re'', ''Munich Reinsurance Company'', ''Optimum Reinsurance Company'', ''Partner Reinsurance Company'', ''RGA Reinsurance Company'', ''SCOR Reinsurance Company'')
			)
		';

	VSQL3 := '
		DELETE FROM AsGroupCustomer
		WHERE ClientGUID IN (
			SELECT ClientGUID FROM AsClient WHERE CompanyName IN (''Ultra Re'', ''Munich Reinsurance Company'', ''Optimum Reinsurance Company'', ''Partner Reinsurance Company'', ''RGA Reinsurance Company'', ''SCOR Reinsurance Company'')
			)
		';

	VSQL4 := '
		DELETE FROM AsClient
		WHERE ClientGUID IN (
			SELECT ClientGUID FROM AsClient WHERE CompanyName IN (''Ultra Re'', ''Munich Reinsurance Company'', ''Optimum Reinsurance Company'', ''Partner Reinsurance Company'', ''RGA Reinsurance Company'', ''SCOR Reinsurance Company'')
			)
		';

	-- Insert Munich Reinsurance Company
	VSQL5 := '
		INSERT INTO AsClient (ClientGUID, TypeCode, CompanyName, UpdatedGMT, LegalResidenceCountryCode, EntityTypeCode)
		VALUES (''71C505E4-6D87-482C-9624-3407E30DC4A4'', ''20'', ''Munich Reinsurance Company'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''), ''CA'', ''GROUPCUST'')
		';

	VSQL6 := '
		INSERT INTO AsGroupCustomer (GroupCustomerGUID, ClientGUID, PrimaryEnrollmentRelationship, EnrollmentClassGroup, HierarchyRelationship)
		VALUES (''EAC6F151-C96B-426D-A0D3-983D54CA926D'',''71C505E4-6D87-482C-9624-3407E30DC4A4'',''CONTACT'',''03'',''CONTACT'')
		';

	VSQL7 := '
		INSERT INTO AsRole (RoleGUID, CompanyGUID, ClientGUID, RoleCode)
		VALUES (''85F5D5FC-7447-4CC2-B22F-E66663CFEA34'', ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'', ''71C505E4-6D87-482C-9624-3407E30DC4A4'', ''02'')
		';

	VSQL8 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''71C505E4-6D87-482C-9624-3407E30DC4A4'', ''CompanyReinsuranceLimit'', ''03'', 999999999)
		';
		
	VSQL9 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, DateValue)
		VALUES (''71C505E4-6D87-482C-9624-3407E30DC4A4'', ''OriginalEffectiveDate'', ''01'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''))
		';
		
	VSQL10 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''71C505E4-6D87-482C-9624-3407E30DC4A4'', ''ReinsurerNumber'', ''03'', 20)
		';
	
	-- Insert Optimum Reinsurance Company
	VSQL11 := '
		INSERT INTO AsClient (ClientGUID, TypeCode, CompanyName, UpdatedGMT, LegalResidenceCountryCode, EntityTypeCode)
		VALUES (''6A14A033-18C9-44C7-5847-7FCE45F428E4'', ''20'', ''Optimum Reinsurance Company'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''), ''CA'', ''GROUPCUST'')
		';

	VSQL12 := '
		INSERT INTO AsGroupCustomer (GroupCustomerGUID, ClientGUID, PrimaryEnrollmentRelationship, EnrollmentClassGroup, HierarchyRelationship)
		VALUES (''57B8AFB3-5AB5-2D4D-ACF3-59EFF19EE2D9'',''6A14A033-18C9-44C7-5847-7FCE45F428E4'',''CONTACT'',''03'',''CONTACT'')
		';

	VSQL13 := '
		INSERT INTO AsRole (RoleGUID, CompanyGUID, ClientGUID, RoleCode)
		VALUES (''7B47DDD8-31F6-0764-03DF-BA558F54332B'', ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'', ''6A14A033-18C9-44C7-5847-7FCE45F428E4'', ''02'')
		';

	VSQL14 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''6A14A033-18C9-44C7-5847-7FCE45F428E4'', ''CompanyReinsuranceLimit'', ''03'', 999999999)
		';
		
	VSQL15 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, DateValue)
		VALUES (''6A14A033-18C9-44C7-5847-7FCE45F428E4'', ''OriginalEffectiveDate'', ''01'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''))
		';
		
	VSQL16 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''6A14A033-18C9-44C7-5847-7FCE45F428E4'', ''ReinsurerNumber'', ''03'', 22)
		';
		
	-- Insert Partner Reinsurance Company
	VSQL17 := '
		INSERT INTO AsClient (ClientGUID, TypeCode, CompanyName, UpdatedGMT, LegalResidenceCountryCode, EntityTypeCode)
		VALUES (''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'', ''20'', ''Partner Reinsurance Company'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''), ''CA'', ''GROUPCUST'')
		';

	VSQL18 := '
		INSERT INTO AsGroupCustomer (GroupCustomerGUID, ClientGUID, PrimaryEnrollmentRelationship, EnrollmentClassGroup, HierarchyRelationship)
		VALUES (''37EEAFEE-9DBC-EA7B-EFDD-F9716AB215E5'',''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'',''CONTACT'',''03'',''CONTACT'')
		';

	VSQL19 := '
		INSERT INTO AsRole (RoleGUID, CompanyGUID, ClientGUID, RoleCode)
		VALUES (''1560A9DA-4DB5-4A92-02BC-0A8F632E8653'', ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'', ''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'', ''02'')
		';

	VSQL20 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'', ''CompanyReinsuranceLimit'', ''03'', 999999999)
		';
		
	VSQL21 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, DateValue)
		VALUES (''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'', ''OriginalEffectiveDate'', ''01'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''))
		';
		
	VSQL22 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''8F92883C-C418-C639-C4C7-9C54ED8EDAC8'', ''ReinsurerNumber'', ''03'', 41)
		';
	
	-- Insert RGA Reinsurance Company
	VSQL23 := '
		INSERT INTO AsClient (ClientGUID, TypeCode, CompanyName, UpdatedGMT, LegalResidenceCountryCode, EntityTypeCode)
		VALUES (''E33971A1-F6FE-7D22-394B-236C5C29E582'', ''20'', ''RGA Reinsurance Company'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''), ''CA'', ''GROUPCUST'')
		';

	VSQL24 := '
		INSERT INTO AsGroupCustomer (GroupCustomerGUID, ClientGUID, PrimaryEnrollmentRelationship, EnrollmentClassGroup, HierarchyRelationship)
		VALUES (''26653180-D14E-0DBF-415D-D36E41D229A9'',''E33971A1-F6FE-7D22-394B-236C5C29E582'',''CONTACT'',''03'',''CONTACT'')
		';

	VSQL25 := '
		INSERT INTO AsRole (RoleGUID, CompanyGUID, ClientGUID, RoleCode)
		VALUES (''819DEF37-69C7-7D9F-0A94-3A37E91F0AC7'', ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'', ''E33971A1-F6FE-7D22-394B-236C5C29E582'', ''02'')
		';

	VSQL26 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''E33971A1-F6FE-7D22-394B-236C5C29E582'', ''CompanyReinsuranceLimit'', ''03'', 999999999)
		';
		
	VSQL27 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, DateValue)
		VALUES (''E33971A1-F6FE-7D22-394B-236C5C29E582'', ''OriginalEffectiveDate'', ''01'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''))
		';
		
	VSQL28 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''E33971A1-F6FE-7D22-394B-236C5C29E582'', ''ReinsurerNumber'', ''03'', 21)
		';
			
	-- Insert SCOR Reinsurance Company
	VSQL29 := '
		INSERT INTO AsClient (ClientGUID, TypeCode, CompanyName, UpdatedGMT, LegalResidenceCountryCode, EntityTypeCode)
		VALUES (''E4032EB0-575F-6923-DB02-3975F3623A8B'', ''20'', ''SCOR Reinsurance Company'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''), ''CA'', ''GROUPCUST'')
		';

	VSQL30 := '
		INSERT INTO AsGroupCustomer (GroupCustomerGUID, ClientGUID, PrimaryEnrollmentRelationship, EnrollmentClassGroup, HierarchyRelationship)
		VALUES (''9A0131C3-657D-A789-52C0-1F53D8528F9E'',''E4032EB0-575F-6923-DB02-3975F3623A8B'',''CONTACT'',''03'',''CONTACT'')
		';

	VSQL31 := '
		INSERT INTO AsRole (RoleGUID, CompanyGUID, ClientGUID, RoleCode)
		VALUES (''7D4E84C9-5051-0F24-BDE7-FA49756FE544'', ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'', ''E4032EB0-575F-6923-DB02-3975F3623A8B'', ''02'')
		';

	VSQL32 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''E4032EB0-575F-6923-DB02-3975F3623A8B'', ''CompanyReinsuranceLimit'', ''03'', 999999999)
		';
		
	VSQL33 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, DateValue)
		VALUES (''E4032EB0-575F-6923-DB02-3975F3623A8B'', ''OriginalEffectiveDate'', ''01'', TO_TIMESTAMP(''10/1/2019 00:00:00'',''mm/dd/yyyy HH24:MI:SS''))
		';
		
	VSQL34 := '
		INSERT INTO AsClientField (ClientGUID, FieldName, FieldTypeCode, IntValue)
		VALUES (''E4032EB0-575F-6923-DB02-3975F3623A8B'', ''ReinsurerNumber'', ''03'', 36)
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
	EXECUTESQL ( VSQL29, VRESULT );
	EXECUTESQL ( VSQL30, VRESULT );
	EXECUTESQL ( VSQL31, VRESULT );
	EXECUTESQL ( VSQL32, VRESULT );
	EXECUTESQL ( VSQL33, VRESULT );
	EXECUTESQL ( VSQL34, VRESULT );
	
END;

DECLARE 
  VSQL1 VARCHAR2(32767);
  VSQL2 VARCHAR2(32767);
  VSQL3 VARCHAR2(32767);
  VSQL4 VARCHAR2(32767);
  VSQL5 VARCHAR2(32767);
  VSQL6 VARCHAR2(32767);
  VSQL7 VARCHAR2(32767);
  VSQL8 VARCHAR2(32767);

  VRESULT VARCHAR2(32767);

BEGIN 

VSQL1 :='DELETE FROM asusersecuritygroup
WHERE
    clientguid IN (
        SELECT
            clientguid
        FROM
            asuser
        WHERE
            clientnumber = ''clearcache''
    )';

VSQL2 := 'DELETE FROM asclient
WHERE
    clientguid IN (
        SELECT
            clientguid
        FROM
            asuser
        WHERE
            clientnumber = ''clearcache''
    )';

VSQL3 := 'DELETE FROM asrole
WHERE
    clientguid IN (
        SELECT
            clientguid
        FROM
            asuser
        WHERE
            clientnumber = ''clearcache''
    )';


VSQL4 :='DELETE FROM asuser
WHERE
    clientnumber = ''clearcache''';
	
VSQL5 := 'INSERT INTO asuser (
    clientguid,
    clientnumber,
    password,
    localecode,
    userstatus
) VALUES ( ''8C338F40-8F4F-4708-B0EF-3EA09B78F2E8'',
           ''clearcache'',
           ''10000152443422kZjm1czYVuY4Bd5ufxYIsA4RHRytB6K7brEhQu2XxxE='',
           ''02'',
           ''01'' )';

VSQL6 := 'INSERT INTO asusersecuritygroup (
    securitygroupguid,
    clientguid,
    roleeffectivefrom,
    roleeffectiveto
) VALUES ( ''84DA2997-467D-4B71-9671-24D25EAF6CDA'',
           ''8C338F40-8F4F-4708-B0EF-3EA09B78F2E8'',
		   TO_TIMESTAMP(''2025-07-21T00:00:00.000'', ''YYYY-MM-DD"T"HH24:MI:SS.FF3''),
           NULL )';

VSQL7 := 'INSERT INTO asclient (
    clientguid,
    typecode,
    companyname,
    lastname,
    firstname,
    middleinitial,
    prefix,
    suffix,
    sex,
    dateofbirth,
    dateofdeath,
    taxid,
    email,
    xmldata,
    updatedgmt,
    legalresidencecountrycode,
    radio1,
    radio2,
    combo1,
    alternatename1,
    alternatename2,
    alternatename3,
    alternatename4,
    alternatename5,
    additionalprefix,
    additionalsuffix,
    taxidtype,
    title,
    maritalstatus,
    birthcountrycode,
    citizenshipcountrycode,
    birthregioncode,
    primaryphone,
    textfield1,
    textfield2,
    checkbox1,
    checkbox2,
    combo2,
    date1,
    date2,
    entitytypecode,
    statuscode
) VALUES ( ''8C338F40-8F4F-4708-B0EF-3EA09B78F2E8'',
           ''99'',
           NULL,
           ''clearcache'',
           ''clearcache'',
           NULL,
           NULL,
           NULL,
           ''M'',
           NULL,
           NULL,
           NULL,
           ''clearcache@ia.ca.com'',
           empty_clob(),
			TO_TIMESTAMP(''2025-07-21T00:00:00.000'', ''YYYY-MM-DD"T"HH24:MI:SS.FF3''),
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           NULL,
           ''CLIENT'',
           NULL )';

VSQL8 := 'INSERT INTO asrole (
    roleguid,
    companyguid,
    policyguid,
    segmentguid,
    clientguid,
    externalclientguid,
    statecode,
    rolecode,
    percentdollarcode,
    rolepercent,
    roleamount,
    xmldata,
    statuscode
) VALUES ( ''2FE3EB65-918A-4893-A1A2-1BF5FBA61D04'',
           ''8E431317-BD23-480E-AA50-CE2F9BBAF3DE'',
           NULL,
           NULL,
           ''8C338F40-8F4F-4708-B0EF-3EA09B78F2E8'',
           NULL,
           NULL,
           ''02'',
           NULL,
           NULL,
           NULL,
           empty_clob(),
           NULL )';
		   
VRESULT := NULL;

  EXECUTESQL ( VSQL1, VRESULT );
  EXECUTESQL ( VSQL2, VRESULT );
  EXECUTESQL ( VSQL3, VRESULT );
  EXECUTESQL ( VSQL4, VRESULT );
  EXECUTESQL ( VSQL5, VRESULT );
  EXECUTESQL ( VSQL6, VRESULT );
  EXECUTESQL ( VSQL7, VRESULT );
  EXECUTESQL ( VSQL8, VRESULT );
  
  
END;		   
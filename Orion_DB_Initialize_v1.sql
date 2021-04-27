SET SERVEROUTPUT ON;
DECLARE
nCount NUMBER;
BEGIN
SELECT count(*) into nCount FROM user_tables where table_name = 'LOCATION';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('LOCATION TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE LOCATION(
    LOC_ID NUMBER(10) PRIMARY KEY,
    CITY VARCHAR(50),
    STATE VARCHAR (50),
    COUNTRY VARCHAR(50))';


EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (1, ''Boston'', ''Massachusetts'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (2, ''Cambridge'', ''Massachusetts'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (3, ''Houston'', ''Texas'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (4, ''Dallas'', ''Texas'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (5, ''Austin'', ''Texas'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (6, ''San Jose'', ''California'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (7, ''San Francisco'', ''California'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (8, ''New York City'', ''New York'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (9, ''Buffalo'', ''New York'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (10, ''Newark'', ''New Jersey'', ''United States'')';
EXECUTE IMMEDIATE 'INSERT INTO LOCATION VALUES (11, ''Others'', ''Others'', ''Others'')';

END IF;
COMMIT;

SELECT count(*) into nCount FROM user_tables where table_name = 'UNIVERSITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('UNIVERSITY TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE UNIVERSITY(
    UNI_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 101 INCREMENT by 1),
    UNI_NAME VARCHAR(100),
    LOC_ID NUMBER(10) REFERENCES LOCATION(LOC_ID),
    PRIMARY KEY(UNI_ID))';

EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''Northeastern University'', 1)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''University of Texas at Dallas'', 4)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''San Jose State University'', 6)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''SUNY Buffalo'', 9)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''New York University'', 8)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''University of Cambridge'', 2)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''Harvard University'', 2)';
EXECUTE IMMEDIATE 'INSERT INTO UNIVERSITY (UNI_NAME, LOC_ID) VALUES (''Others'', 11)';

END IF;

COMMIT;
SELECT count(*) into nCount FROM user_tables where table_name = 'DEPARTMENT';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE  'CREATE TABLE DEPARTMENT(
    DEPT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 10 INCREMENT by 5),
    DEPT_NAME VARCHAR(50) NOT NULL,
    PRIMARY KEY (DEPT_ID) )';

    EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Engineering'')';
	EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Science'')';
	EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Business Administration'')';
	EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Architecture'')';
	EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Art History'')';
	EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Medicine'')';
    EXECUTE IMMEDIATE 'INSERT INTO DEPARTMENT (DEPT_NAME) VALUES (''Others'')';


END IF;
COMMIT;
SELECT count(*) into nCount FROM user_tables where table_name = 'COURSE_MAJOR';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('COURSE_MAJOR TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE COURSE_MAJOR(
    MAJ_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 3001 INCREMENT by 1),
    MAJ_NAME VARCHAR (50) NOT NULL,
    DEPT_ID NUMBER(10) REFERENCES DEPARTMENT(DEPT_ID),
    PRIMARY KEY (MAJ_ID))';

    EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Computer Software '', 10)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Biotechnology'', 15)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Civil Engineering'', 10)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Applied Physics'', 15)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Environment Science'', 15)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Pharmacology'', 35)';
	EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Project Management'', 20)';
    EXECUTE IMMEDIATE 'INSERT INTO COURSE_MAJOR (MAJ_NAME, DEPT_ID) VALUES (''Others'', 25)';

END IF;
COMMIT;
SELECT count(*) into nCount FROM user_tables where table_name = 'EVENT_STATUS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('EVENT_STATUS TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE EVENT_STATUS(
    EVT_STATUS_ID NUMBER(10) PRIMARY KEY,
    EVT_STATUS VARCHAR(50) NOT NULL )';

    EXECUTE IMMEDIATE 'INSERT INTO EVENT_STATUS VALUES (1, ''Registration Open'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_STATUS VALUES (2, ''Registration Closed'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_STATUS VALUES (3, ''Archived'')';


 END IF;
COMMIT;
SELECT count(*) into nCount FROM user_tables where table_name = 'EVENT_CATEGORY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('EVENT_CATEGORY TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE EVENT_CATEGORY(
    CAT_ID NUMBER(10) PRIMARY KEY,
    CAT_NAME VARCHAR(50) NOT NULL)';

    EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (1, ''Speaker Series'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (2, ''Cultural'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (3, ''Technical'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (4, ''Job Fair'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (5, ''Book Reading'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (6, ''Hackathon'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (7, ''Robotics'')';
	EXECUTE IMMEDIATE 'INSERT INTO EVENT_CATEGORY VALUES (8, ''Other'')';


END IF;

COMMIT;
SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'MEMBER_TYPE';

IF ( ncount > 0 ) 
THEN 
    dbms_output.put_line('MEMBER_TYPE TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE MEMBER_TYPE(
    MEM_TYPE_ID NUMBER(10) PRIMARY KEY,
    MEM_TYPE VARCHAR(50) NOT NULL)';
    
    EXECUTE IMMEDIATE 'INSERT INTO MEMBER_TYPE (MEM_TYPE_ID, MEM_TYPE) VALUES (1, ''Student'')';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBER_TYPE (MEM_TYPE_ID, MEM_TYPE) VALUES (2, ''Professor'')';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBER_TYPE (MEM_TYPE_ID, MEM_TYPE) VALUES (3, ''Alumni'')';
    
END IF;
COMMIT;
SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'DEGREE_LEVEL';

IF ( ncount > 0 ) THEN
        dbms_output.put_line('DEGREE_LEVEL TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE DEGREE_LEVEL(
    DEG_ID NUMBER(10) PRIMARY KEY,
    DEG_NAME VARCHAR(50) NOT NULL)';
    
    EXECUTE IMMEDIATE 'INSERT INTO DEGREE_LEVEL (DEG_ID, DEG_NAME) VALUES (1, ''Undergraduate'')';
    EXECUTE IMMEDIATE 'INSERT INTO DEGREE_LEVEL (DEG_ID, DEG_NAME) VALUES (2, ''Graduate'')';
    EXECUTE IMMEDIATE 'INSERT INTO DEGREE_LEVEL (DEG_ID, DEG_NAME) VALUES (3, ''PhD'')';

END IF;
COMMIT;
SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'EVENT_SITE';
IF ( ncount > 0 )
THEN
        dbms_output.put_line('EVENT_SITE TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE EVENT_SITE(
    SITE_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 11 INCREMENT by 1),
    SITE_NAME VARCHAR(50) NOT NULL,
    UNI_ID NUMBER(10) REFERENCES UNIVERSITY(UNI_ID),
    CAPACITY NUMBER(10) NOT NULL,
    PRIMARY KEY(SITE_ID))';
        
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''Ell hall'', 101,10)';
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''Dodge Hall'', 105,40)';
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''Shilman'', 106,50)';
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''Snell'', 104,100)';
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''East Village'', 107,40)';
    EXECUTE IMMEDIATE 'INSERT INTO EVENT_SITE (SITE_NAME, UNI_ID, CAPACITY ) VALUES (''Kerr Hall'', 102,50)';
    
END IF;
COMMIT;
SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'MEMBERS';
IF ( ncount > 0 ) THEN
        dbms_output.put_line('MEMBERS TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE MEMBERS(
    MEMBER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
    LOC_ID NUMBER(10) REFERENCES LOCATION(LOC_ID),
    MEM_TYPE_ID NUMBER(10) REFERENCES MEMBER_TYPE(MEM_TYPE_ID),
    USERNAME VARCHAR(10s0) UNIQUE)';
    
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES (5001, ''Miley'', ''Harrison'', ''Miley123'',1,2)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ( (Select max(MEMBER_ID)+1 from MEMBERS), ''Savana'', ''Cameron'', ''Savana123'',3,10)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Walter'', ''Edwards'', ''Walter123'',2,5)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Daryl'', ''Gibson'', ''Daryl123'',1,2)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS),''Isabella'', ''Thompson'', ''Isabella123'',2,5)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Jenna'', ''Dixon'', ''Jenna123'',3,3)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Lucia'', ''Gray'', ''Lucia123'',1,2)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Alfred'', ''Murphy'', ''Alfred123'',1,1)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Blake'', ''Owens'', ''Blake123'',1,5)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Dainton'', ''Russell'', ''Dainton123'',2,7)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Stella'', ''Thompson'', ''Stella123'',2,7)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Roman'', ''Spencer'', ''Roman123'',3,3)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Brianna'', ''Jones'', ''Brianna123'',1,8)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Ada'', ''Nelson'', ''Ada123'',3,7)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Connie'', ''Harper'', ''Connie123'',2,10)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Alina'', ''Jones'', ''Alina123'',1,2)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Brianna'', ''Roberts'', ''Brianna123'',2,6)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Dale'', ''Brooks'', ''Dale123'',2,2)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Elian'', ''Miller'', ''Elian123'',3,4)';
    EXECUTE IMMEDIATE 'INSERT INTO MEMBERS (MEMBER_ID, FIRST_NAME, LAST_NAME, PASSWORD, MEM_TYPE_ID , LOC_ID) VALUES ((Select max(MEMBER_ID)+1 from MEMBERS), ''Aston'', ''Campbell'', ''Aston123'',3,8)';
            
END IF;

SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'PROFESSOR';

IF ( ncount > 0 ) 
THEN
        dbms_output.put_line('PROFESSOR TABLE ALREADY EXISTS');
ELSE
        EXECUTE IMMEDIATE 'CREATE TABLE PROFESSOR(
        MEMBER_ID NUMBER(10) REFERENCES MEMBERS (MEMBER_ID),
        PROF_BACKGROUND VARCHAR(400) NOT NULL,
        PROF_HIGHEST_QUAL VARCHAR(400) NOT NULL)';
        
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5003,''Human-Computer Interaction, Ubiquitous Computing, Software Engineering'',''Master’s in Business Administration and Management, General'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5005,''Wireless Sensor Networks, Internet of Things, Embedded Systems, Quality-of-Service for Multimedia Networking, Computer Networks Management and Design.'',''Master’s in Engineering'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5010,''Power system monitoring, estimation and optimization, fault location and identification in power grids'',''Master’s in Social Work'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5011,''Contact mechanics including adhesion, friction, and plasticity; modeling and analysis of MEMS; modeling and analysis in nanomechanics'',''Master’s in Education, General'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5015,''Area of Focus: Telecommunication Networks, Software Engineering Systems, Internet of Thing'',''Master’s in Accounting'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5017,''Applied operations research, healthcare, supply chain, large scale optimization, and big data analytics'',''Master’s in Educational Leadership and Administration, General'')';
        EXECUTE IMMEDIATE 'INSERT INTO PROFESSOR (MEMBER_ID , PROF_BACKGROUND, PROF_HIGHEST_QUAL) VALUES (5018,''Nonlinear dynamics, geophysical fluid dynamics, computational fluid mechanics, disaster response, experimental fluids'',''Master’s in Registered Nursing'')';
END IF;
COMMIT;
SELECT COUNT(*) INTO ncount FROM user_tables WHERE table_name = 'ALUMNI';
IF ( ncount > 0 ) 
THEN
        dbms_output.put_line('ALUMNI TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE ALUMNI(
    MEMBER_ID NUMBER(10) REFERENCES MEMBERS (MEMBER_ID) UNIQUE NOT NULL,
    ORGANIZATION VARCHAR(50) NOT NULL,
    POSITION VARCHAR(50) NOT NULL,
    EXPERIENCE NUMBER(10) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL,
    ALUMNI_BACKGROUND VARCHAR(400) NOT NULL)';
        
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5002,''Fidelity Investments'', ''Data Scientist'',26, ''savana.cam@gmail.com'', ''Data/BI Engineer, ETL, Hadoop'')';
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5012,''BirchStreet Systems'', ''Application Support Engineer'',34, ''spence_roman@yahoomail.com'', ''Experience in data networks management. Skill- Firewall security, Azure'')';
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5006,''FireEye Inc'', ''Senior Security Engineer'',15, ''Jenna.dixon@gmail.com'', ''Developed POS and smart card based applications. Skills- OCI, AWS'')';
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5014,''Amazon'', ''Software Engineer'',48, ''nel.ada@hotmail.com'', ''AWS, Python, Data Analyst'')';
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5019,''Johnson'', ''Area Business Incharge'',39, ''elian.miller@gmail.com'', ''FMCG, Distributed Team Management, Channel Sales'')';
    EXECUTE IMMEDIATE 'INSERT INTO ALUMNI (MEMBER_ID, ORGANIZATION ,POSITION , EXPERIENCE, EMAIL ,ALUMNI_BACKGROUND) VALUES (5020,''BMW'', ''Human Resource- Intern'',10, ''camp.aston92@gmail.com'', ''Skilled in Management, Leadership, Six Sigma'')';

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'STUDENT';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('STUDENT TABLE ALREADY EXISTS');
ELSE
     EXECUTE IMMEDIATE 'CREATE TABLE STUDENT(
      MEMBER_ID NUMBER(10)REFERENCES MEMBERS(MEMBER_ID),
      UNI_ID NUMBER(10) REFERENCES UNIVERSITY(UNI_ID),
      MAJ_ID NUMBER(10) REFERENCES COURSE_MAJOR(MAJ_ID),
      DEGREE_LEVEL NUMBER(10) REFERENCES DEGREE_LEVEL(DEG_ID) NOT NULL,
      EMAIL VARCHAR(400) NOT NULL,
      STUDENT_BACKGROUND VARCHAR(50),
      EXPECTED_GRADDATE DATE NOT NULL,
      CHECK(EMAIL LIKE ''%@%edu%''))';  
 
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5001,101,3001,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''UNDERGRADUATE''),''HarrisonMiley@northeastern.edu'',''information systems'',((to_date(''Feb 2023'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5004,101,3002,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''GRADUATE''),''GibsonDaryl@northeastern.edu'',''coumputer science'',((to_date(''Jan 2023'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5007,101,3003,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''UNDERGRADUATE''),''GrayLucia@northeastern.edu'',''engineering'',((to_date(''Mar 2023'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5008,101,3007,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''PHD''),''MurphyAlfred@northeastern.edu'',''informationsystem'',((to_date(''Jan 2024'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5009, 102,3007,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''GRADUATE''),''OwensBlake@texasdallas.edu'',''informationsystem'',((to_date(''Aug 2022'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5013,104,3004,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''GRADUATE''),''JonesBrianna@sunnybuffalow.edu'',''physics'',((to_date(''May 2022'', ''Mon YYYY''))))';
EXECUTE IMMEDIATE 'INSERT INTO STUDENT  VALUES (5016,105,3001,(select DEG_ID from DEGREE_LEVEL WHERE UPPER(DEG_NAME)=''PHD''),''JonesAlina@newyorkuniversity.edu'',''informatics'',((to_date(''Jul 2024'', ''Mon YYYY''))))';
END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'PROF_UNIVERSITY';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('PROF_UNIVERSITY TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE PROF_UNIVERSITY(
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 10 INCREMENT by 5),
    PROF_ID NUMBER(10) REFERENCES MEMBERS(MEMBER_ID),
    UNI_ID NUMBER(10) REFERENCES UNIVERSITY(UNI_ID),
    EMAIL VARCHAR(100),  
    CHECK(EMAIL LIKE ''%@%edu%''))';  

EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5003,101,''EdwardsWalter@northeastern.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5003,102,''EdwardsWalter@texasdallas.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5003,103,''EdwardsWalter@sanjos.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5005,101,''ThompsonIsabella@northeastern.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5010,104,''RussellDainton@sunnybuffalo.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5011,105,''ThompsonStella@newyorkuniverstiy.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5015,102,''ConnieHarper@texasdallas.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5017,106,''RobertsBrianna@cambridgeuniversity.edu'')';
EXECUTE IMMEDIATE 'INSERT INTO Prof_University (PROF_ID, UNI_ID, EMAIL) VALUES (5018,107,''DaleBrooks@harvarduniverstiy.edu'')'; 

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'OPEN_SOURCE_PROJECTS';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('OPEN_SOURCE_PROJECTS TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE OPEN_SOURCE_PROJECTS(
    PROJ_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 4001 INCREMENT by 1),
    PROJ_NAME  VARCHAR(100) NOT NULL,
    PROJ_DESC  VARCHAR(4000) NOT NULL,
    PROJ_REPO VARCHAR(400) NOT NULL,
    PROF_ID  NUMBER(10) REFERENCES MEMBERS(MEMBER_ID),
    UNI_ID NUMBER(10) REFERENCES UNIVERSITY(UNI_ID))';

EXECUTE IMMEDIATE 'INSERT INTO OPEN_SOURCE_PROJECTS ( PROJ_NAME,PROJ_DESC,PROJ_REPO,PROF_ID ,UNI_ID) VALUES (''ORION'',''inter university connection tool'',''https://github.com/ankita2310/DMDD_Orion'',5003,101)';
EXECUTE IMMEDIATE 'INSERT INTO OPEN_SOURCE_PROJECTS ( PROJ_NAME,PROJ_DESC,PROJ_REPO,PROF_ID,UNI_ID) VALUES (''GMOD'',''videogame development modding'',''https://github.com/Facepunch/garrysmod'',5015,102)';
EXECUTE IMMEDIATE 'INSERT INTO OPEN_SOURCE_PROJECTS ( PROJ_NAME,PROJ_DESC,PROJ_REPO,PROF_ID,UNI_ID) VALUES (''spark'',''improoving functionality of apache spark'',''https://github.com/awesome-spark/awesome-spark'',5010,104)';
EXECUTE IMMEDIATE 'INSERT INTO OPEN_SOURCE_PROJECTS ( PROJ_NAME,PROJ_DESC,PROJ_REPO,PROF_ID,UNI_ID) VALUES (''neuratech'',''creating list of BCI resources'',''https://github.com/NeuroTechX/awesome-bci'',5005,101)';

END IF;
SELECT count(*) into nCount FROM user_tables where table_name = 'EVENT';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('EVENT TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE EVENT(
    EVT_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 2001 INCREMENT by 1) PRIMARY KEY,
    EVT_NAME VARCHAR(100) NOT NULL,
    EVT_CAT_ID NUMBER(10) NOT NULL REFERENCES EVENT_CATEGORY(CAT_ID),
    EVT_DATETIME DATE NOT NULL,
    EVT_HOST_ID  NUMBER(10) REFERENCES MEMBERS(MEMBER_ID),
    EVT_VENUE NUMBER(10) REFERENCES EVENT_SITE (SITE_ID ),
    EVT_LINK VARCHAR(400),
    EVT_STATUS NUMBER(10) REFERENCES EVENT_STATUS(EVT_STATUS_ID))';
 
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_STATUS,EVT_LINK,EVT_DATETIME)  VALUES (''OVERCOMING IMPOSTER SYNDROME'',2,5001,3,''http://calendar.northeastern.edu/event/overcoming_imposter_syndrome_in_academia'',((to_date(''03/05/2021'', ''DD/MM/YYYY''))))';    
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_VENUE,EVT_STATUS,EVT_DATETIME) VALUES (''Linguistics Program Poster Session'',2,5007,14,1,((to_date(''5/5/2021'', ''DD/MM/YYYY''))))';    
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_VENUE,EVT_STATUS,EVT_DATETIME) VALUES (''Post-COVID Futures: How Design and Architecture Affect Public Health Wellness and the Future of Work'',1,5002,11,2,((to_date(''04/06/2021'', ''DD/MM/YYYY''))))';  
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_STATUS,EVT_LINK,EVT_DATETIME)  VALUES (''ECE PhD Dissertation Defense: Ahmet Oner'',1,5008,2,''http://calendar.northeastern.edu/event/ece_phd_dissertation_defense_ahmet_oner'',((to_date(''04/06/2021'', ''DD/MM/YYYY''))))';  
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_STATUS,EVT_LINK,EVT_DATETIME)  VALUES (''ECE PhD Dissertation Defense: Ahmet Oner'',1,5008,2,''http://calendar.northeastern.edu/event/ece_phd_dissertation_defense_ahmet_oner'',((to_date(''04/06/2021'', ''DD/MM/YYYY''))))';  
EXECUTE IMMEDIATE 'INSERT INTO EVENT (EVT_NAME,EVT_CAT_ID,EVT_HOST_ID,EVT_STATUS,EVT_LINK,EVT_DATETIME)  VALUES (''ECE MS Thesis Defense: Yize Li'',8,5013,3,''http://calendar.northeastern.edu/event/ece_ms_thesis_defense_yize_li'',((to_date(''14/4/2021'', ''DD/MM/YYYY''))))';  

END IF;

SELECT count(*) into nCount FROM user_tables where table_name = 'EVENT_REGISTRATION';
IF(nCount > 0)
THEN
    DBMS_OUTPUT.PUT_LINE('EVENT_REGISTRATION TABLE ALREADY EXISTS');
ELSE
    EXECUTE IMMEDIATE 'CREATE TABLE EVENT_REGISTRATION (
    REG_ID NUMBER GENERATED BY DEFAULT AS IDENTITY(START with 10 INCREMENT by 1),
    MEMBER_ID NUMBER(10)REFERENCES MEMBERS(MEMBER_ID),
    EVT_ID NUMBER REFERENCES EVENT(EVT_ID) ON DELETE CASCADE)';   
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2001,5001)';
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2002,5004)';
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2003,5007)';
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2004,5008)';
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2005,5009)';
EXECUTE IMMEDIATE 'INSERT INTO EVENT_REGISTRATION (EVT_ID, MEMBER_ID) VALUES (2006,5013)';
END IF;
COMMIT;
END;
--COMMIT;


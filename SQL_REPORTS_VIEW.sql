SELECT * FROM STUDENT
SELECT * FROM MEMBERS
SELECT * FROM DEGREE_LEVEL
CREATE VIEW ordersview1
SELECT * FROM COURSE_MAJOR
SELECT * FROM  Department;
SELECT * FROM university
SELECT * FROM PROFESSOR
SELECT * FROM PROF_UNIVERSITY;
SELECT * FROM OPEN_SOURCE_PROJECTS
SELECT * FROM EVENT
SELECT * FROM EVENT_SITE
SELECT * FROM EVENT_STATUS
SELECT * FROM EVENT_CATEGORY
SELECT * FROM EVENT_REGISTRATION

CREATE OR REPLACE VIEW MEMBERSUDENT AS
SELECT M.FIRST_NAME, M.LAST_NAME,S.EMAIL,U.UNI_NAME,D.DEG_NAME,C.MAJ_NAME,S.STUDENT_BACKGROUND,S.EXPECTED_GRADDATE,
FROM STUDENT S JOIN MEMBERS M
ON M.MEMBER_ID = S.MEMBER_ID
JOIN COURSE_MAJOR C
ON  C.MAJ_ID=S.MAJ_ID
JOIN DEGREE_LEVEL D
ON  S.DEGREE_LEVEL= DEG_ID
JOIN UNIVERSITY U
ON S.UNI_ID = U.UNI_id;
SELECT * FROM MEMBERSUDENT

CREATE OR REPLACE VIEW INFOPROFF AS
SELECT M.FIRST_NAME,M.LAST_NAME,PU.EMAIL,U.UNI_NAME,P.PROF_BACKGROUND,O.PROJ_NAME
FROM PROF_UNIVERSITY PU JOIN MEMBERS M
ON M.MEMBER_ID = PU.PROF_ID
JOIN PROFESSOR P
ON  P.MEMBER_ID=M.MEMBER_ID
JOIN OPEN_SOURCE_PROJECTS O
ON  O.PROF_ID= M.MEMBER_ID
JOIN UNIVERSITY U
ON PU.UNI_ID = U.UNI_id;
SELECT * FROM INFOPROFF


CREATE OR REPLACE VIEW EVENTS_VIEW AS
SELECT E.EVT_NAME,M.FIRST_NAME AS HOST_NAME,E.EVT_DATETIME,E.EVT_LINK,ES.EVT_STATUS AS EVENT_STATUS ,EE.SITE_NAME,EC.CAT_NAME AS CATEGORY
FROM EVENT E JOIN EVENT_REGISTRATION ER
ON E.EVT_ID =ER.EVT_ID
 JOIN EVENT_STATUS ES
ON E.EVT_STATUS =ES.EVT_ID
LEFT JOIN EVENT_SITE EE
ON E.EVT_VENUE=EE.SITE_ID
JOIN MEMBERS M
ON E.EVT_HOST_ID =M.MEMBER_ID
JOIN EVENT_CATEGORY EC
ON E.EVT_CAT_ID=EC.CAT_ID;
SELECT * FROM EVENTS_VIEW

CREATE OR REPLACE VIEW PROJECT AS
SELECT U.UNI_NAME,PROJ_NAME,PROJ_DESC AS PROJECT_DESCRIPTION,PROJ_REPO AS PROJECT_REPOSITORY,M.FIRST_NAME AS PROFESSOR_FIRST_NAME ,M.LAST_NAME AS PROFESSOR_LAST_NAME
FROM OPEN_SOURCE_PROJECTS O 
JOIN UNIVERSITY U
ON O.UNI_ID =U.UNI_ID
JOIN MEMBERS M
ON M.MEMBER_ID=O.PROF_ID;
SELECT * FROM PROJECT

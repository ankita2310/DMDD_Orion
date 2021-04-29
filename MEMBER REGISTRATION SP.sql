--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure REGISTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."REGISTER" (FIRST_NM IN VARCHAR2, LAST_NM IN VARCHAR2, PWD IN VARCHAR, 
MEM IN NUMBER, LOC IN VARCHAR2)
AS
locid number(10);
memid number(10);
usr_nm varchar2(100);
member_type varchar2(100);
degree number(3);
course number(3);
p_len number(12);
e_invalid_PWD EXCEPTION;
max_ID number(10);
ERR NUMBER(10);
BEGIN
select length(PWD) INTO p_len from dual;
IF
(p_len < 12)
THEN
RAISE e_invalid_PWD;
END IF;

select (MAX(MEMBER_ID)+1) into max_ID from MEMBERS;

ERR:=1;
SELECT LOC_ID INTO locid FROM LOCATION WHERE UPPER(CITY)= UPPER(LOC);

INSERT INTO MEMBERS (MEMBER_ID,FIRST_NAME,LAST_NAME,PASSWORD,MEM_TYPE_ID,LOC_ID)
values
(max_ID, FIRST_NM, LAST_NM, PWD,MEM,locid);

COMMIT;


UPDATE MEMBERS SET USERNAME=FIRST_NAME || max_ID WHERE MEMBER_ID=max_ID;
Commit;

SELECT USERNAME INTO usr_nm FROM MEMBERS WHERE MEMBER_ID=max_ID;

EXECUTE IMMEDIATE 'CREATE USER ' || usr_nm || ' IDENTIFIED BY ' || PWD;
EXECUTE IMMEDIATE 'GRANT DB_MEMBERS TO ' || usr_nm;


dbms_output.put_line('User Registration Complete');
dbms_output.put_line('Your UserName is ' || usr_nm);

dbms_output.put_line('*********************************************************************************');

SELECT MEM_TYPE INTO member_type from MEMBER_TYPE WHERE MEM_TYPE_ID=MEM;


dbms_output.put_line('Kindly complete your user setup by providing additional details for your member type-  ' || member_type);
dbms_output.put_line('');

dbms_output.put_line('*********************************************************************************');
IF (MEM=1) THEN

dbms_output.put_line('Choose University from below list ');
dbms_output.put_line('');
dbms_output.put_line('UNIVERSITY' || '   -----------   '    || 'CITY');

 FOR UNI IN 
          (
            SELECT UNI_NAME , L.CITY  FROM UNIVERSITY U JOIN LOCATION L 
            ON U.LOC_ID=L.LOC_ID
          )
          LOOP
            dbms_output.put_line(UNI.UNI_Name || '   -----------   '    || UNI.CITY);
          END LOOP;
dbms_output.put_line('***********************************************');
dbms_output.put_line('Choose Course Major from below list ');
dbms_output.put_line('---------------------------------------------------------');
FOR MAJ IN 
          (
                     SELECT MAJ_NAME FROM Course_Major
          )
          LOOP
                       dbms_output.put_line(MAJ.MAJ_NAME);
          END LOOP;

dbms_output.put_line('***********************************************');


dbms_output.put_line('');
dbms_output.put_line('Choose Degree Level from below list ');
dbms_output.put_line('---------------------------------------------------------');

FOR DEG IN 
          (
            SELECT DEG_NAME FROM DEGREE_LEVEL
          )
          LOOP

            dbms_output.put_line(DEG.DEG_NAME);
          END LOOP;
dbms_output.put_line('***********************************************');        
--SELECT DEG_ID INTO degree FROM DEGREE_LEVEL WHERE UPPER(DEG_NAME)=UPPER('&DEGREE_NAME');

dbms_output.put_line('Please execute the below SP in an anonymous block');
dbms_output.put_line('ADD_STUDENT(''<UniversityName>'',''<Course_Name>'',''<Degree>'',''<Email_ID>'',''<Your Background>'',''<Expected GradDate>'')');

ELSIF (MEM=2) THEN

dbms_output.put_line('Please execute the below SP in an anonymous block');
dbms_output.put_line('ADD_PROFESSOR(''<Professor_Background>'',''<Highest_Qualification>'')');

dbms_output.put_line('Please enter your appropriate University and Valid Email Address');
dbms_output.put_line('Please execute the below SP in an anonymous block');
dbms_output.put_line('ADD_PROFESSORUNIVERSITY(''<UniversityName>'',''<Email_ID>'')');

ELSE 

dbms_output.put_line('Please execute the below SP in an anonymous block');
dbms_output.put_line('ADD_ALUMNI(''<Organization>'',''<Position>'',<Experience>,''<Email>'',''<Professional_Background>'')');

END IF;

EXCEPTION
WHEN 
e_invalid_PWD THEN
dbms_output.put_line('Length of password is less than 12, Please try again!');
WHEN NO_DATA_FOUND THEN
 IF ERR=1 THEN
    DBMS_OUTPUT.PUT_LINE('INVALID LOCATION ENTERED');
  END IF;  
END;

/

  GRANT EXECUTE ON "ADMIN"."REGISTER" TO "DB_MEMBERS";
  GRANT EXECUTE ON "ADMIN"."REGISTER" TO "ORION_ADMIN";

--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ADD_PROFESSORUNIVERSITY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADD_PROFESSORUNIVERSITY" (UNI NUMBER, EMAIL VARCHAR2)
AS 
U_ID NUMBER(10);
M_ID NUMBER(10);
err number(1);

BEGIN

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

SELECT MEMBER_ID INTO M_ID FROM MEMBERS WHERE USERNAME =(SELECT USER FROM DUAL);

err := 1;
SELECT UNI_ID INTO U_ID FROM UNIVERSITY WHERE UPPER(UNI_NAME)=UPPER(UNI);

INSERT INTO PROF_UNIVERSITY(PROF_ID,UNI_ID,EMAIL) VALUES(M_ID,U_ID,EMAIL);

EXCEPTION
WHEN NO_DATA_FOUND THEN
    IF err =1 THEN
    DBMS_OUTPUT.PUT_LINE('INVALID UNIVERSITY');
END IF;
END;

/

  GRANT EXECUTE ON "ADMIN"."ADD_PROFESSORUNIVERSITY" TO "DB_MEMBERS";

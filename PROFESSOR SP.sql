--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ADD_PROFESSOR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADD_PROFESSOR" (BCK IN VARCHAR2, HIGH_QUAL IN VARCHAR2)
AS 
M_ID NUMBER(10);

BEGIN

SELECT MEMBER_ID INTO M_ID FROM MEMBERS WHERE USERNAME =(SELECT USER FROM DUAL);

INSERT INTO PROFESSOR VALUES(M_ID,BCK, HIGH_QUAL);
  
END;

/

  GRANT EXECUTE ON "ADMIN"."ADD_PROFESSOR" TO "DB_MEMBERS";

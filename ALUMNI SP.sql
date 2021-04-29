--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ADD_ALUMNI
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADD_ALUMNI" (ORG IN VARCHAR2, POS IN VARCHAR2, EXP IN NUMBER, MAIL IN VARCHAR2, BCK IN VARCHAR2)
AS
M_ID NUMBER(10);
BEGIN

SELECT MEMBER_ID INTO M_ID FROM MEMBERS WHERE USERNAME =(SELECT USER FROM DUAL);

INSERT INTO ALUMNI VALUES(M_ID, ORG, POS, EXP, MAIL, BCK);

END;

/

  GRANT EXECUTE ON "ADMIN"."ADD_ALUMNI" TO "DB_MEMBERS";

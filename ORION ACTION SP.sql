--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ORION_ACTIONS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ORION_ACTIONS" AS 

BEGIN
dbms_output.put_line('****BELOW IS THE LIST OF FEATURES AVAILABLE IN THE INTER UNIVERSITY CONNECT DATABSASE ****');

dbms_output.put_line('*******VIEW THE LIST OF EVENTS AVAILABLE*******');
dbms_output.put_line('To view the list of Events available, please run the below query');
dbms_output.put_line('SELECT * FROM ALL_EVENTS;');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******EVENT REGISTRATION*******');
dbms_output.put_line('To REGISTER for an Event available, please run the below stored procedure as');
dbms_output.put_line('EXECUTE ADMIN.EVENT_REGISTRATION(EVENT_NAME');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******EVENT DEREGISTRATION*******');
dbms_output.put_line('To DROP the REGISTRATION from an Event available, please run the below stored procedure as');
dbms_output.put_line('EXECUTE ADMIN.EVENT_DEREGISTRATION(EVENT_NAME');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******ALUMNI CONNECT*******');
dbms_output.put_line('To Connect to an Alumni, please run the below query as');
dbms_output.put_line('SELECT * FROM ALL_ALUMNI;');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******PROFESSOR CONNECT*******');
dbms_output.put_line('To Connect to a Professor, please run the below query as');
dbms_output.put_line('SELECT * FROM ALL_PROFESSOR;');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******VIEW THE LIST OF OPEN PROJECTS*******');
dbms_output.put_line('To View the list of Open Projects available, please run the below query as');
dbms_output.put_line('SELECT * FROM ALL_PROJECTS;');
dbms_output.put_line('----------------------------------------');
dbms_output.put_line('*******STUDENTS CONNECT*******');
dbms_output.put_line('To Connect to a Student, please run the below query as');
dbms_output.put_line('SELECT * FROM ALL_STUDENTS;');
  
END;

/

  GRANT EXECUTE ON "ADMIN"."ORION_ACTIONS" TO "DB_MEMBERS";
  GRANT EXECUTE ON "ADMIN"."ORION_ACTIONS" TO "ORION_ADMIN";

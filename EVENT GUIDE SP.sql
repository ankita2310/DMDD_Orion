--------------------------------------------------------
--  File created - Thursday-April-29-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ADD_EVENT_GUIDE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADD_EVENT_GUIDE" 
AS
BEGIN
    dbms_output.put_line('******************************************************');
    dbms_output.put_line('Follow below steps to host an event');

    dbms_output.put_line('*******Select from the below EVENT CATEGORY*******');
     FOR item IN 
              (
                SELECT CAT_NAME FROM EVENT_CATEGORY
              )
              LOOP
                dbms_output.put_line(item.CAT_NAME);
              END LOOP;
    dbms_output.put_line('-------------------------------------------------------------------');
    dbms_output.put_line('*******Select from the below EVENT LOCATION*******');
     FOR item IN 
              (
                SELECT SITE_NAME FROM EVENT_SITE
              )
              LOOP
                dbms_output.put_line(item.SITE_NAME);
              END LOOP;        
    dbms_output.put_line('-------------------------------------------------------------------');

     dbms_output.put_line('Execute below statement to create the event');
     dbms_output.put_line('EXECUTE ADMIN.ADD_EVENT(<EV_NAME>, <EV_CAT>, <EV_DATE(dd-mm-yyyy)>, <EV_VENUE>, <EV_LINK (if available)>)');


END;

/

  GRANT EXECUTE ON "ADMIN"."ADD_EVENT_GUIDE" TO "DB_MEMBERS";

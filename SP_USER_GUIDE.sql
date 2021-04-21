
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE USER_GUIDE
AS
    BEGIN
        dbms_output.put_line('****WELCOME TO ORION****');
        dbms_output.put_line('REGISTER TO CONTINUE..');
        dbms_output.put_line('EXECUTE THE BELOW PROCEDURE WITH THE SPECIFIED PARAMETERS IN AN ANONYMOUS PL/SQL BLOCK AS FOLLOWS');
       
        dbms_output.put_line('REGISTER(FIRST_NAME,LAST_NAME,PASSWORD,MEMBER_TYPE,LOCATION)');
        dbms_output.put_line('-------------------------------------------------------------------');
        dbms_output.put_line('AVAILABLE MEMBER TYPES ARE: ');
        
        FOR item IN 
          (
            SELECT MEM_TYPE_ID, MEM_TYPE FROM MEMBER_TYPE
          )
          LOOP
            dbms_output.put_line('MEMBER_TYPE = ' || item.MEM_TYPE_ID ||              ', FOR  ' || item.MEM_TYPE);
          END LOOP;
        
         dbms_output.put_line('-------------------------------------------------------------------');
         dbms_output.put_line('AVAILABLE LOCATIONS ARE: ');
         dbms_output.put_line('CITY                 STATE');
           FOR LOC IN 
          (
            SELECT CITY,STATE FROM LOCATION
          )
          LOOP
            dbms_output.put_line(LOC.CITY || '   -----------   '    || LOC.STATE);
          END LOOP;
        
        dbms_output.put_line('USERNAME WILL BE DISPLAYED ON THE SCREEN AFTER REGISTRATION.');

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLERRM);
        dbms_output.put_line(dbms_utility.format_error_backtrace);
        ROLLBACK;
END USER_GUIDE;
/
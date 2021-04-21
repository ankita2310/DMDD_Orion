SET SERVEROUTPUT ON
DECLARE
stm varchar2(100);
BEGIN
    FOR IT in(
    select FIRST_NAME,MEMBER_ID FROM MEMBERS
    )
    LOOP
        stm:=IT.FIRST_NAME || IT.MEMBER_ID;
        DBMS_OUTPUT.PUT_LINE(STM);
        update members set username=stm WHERE member_id=IT.MEMBER_ID;
    END LOOP;
    end;

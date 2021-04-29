# DMDD_Orion
GET STARTED! ALL ACTIONS TO BE PERFORMED!

0.TO CONNECT TO THE ORION DATABASE, USE THE FOLLOWING CREDENTIALS TO START UP - 
    USERNAME - ORION_USER
    PASSWORD - Orion9877890
1.You are all set to use the user guide Stored Procedure, please start with the execution of the user_guide as ADMIN.EXECUTE USER_GUIDE;
2.To resgister as a member, please run the 'Register' stored procedure as EXECUTE ADMIN.REGISTER(FIRST_NAME,LAST_NAME,PASSWORD,MEM_TYPE_ID,LOC_ID)
3.Post registration, please use your credentials to start with a new session
4.To access availbe features in the Orion Database, please run the ORION_ACTIONS stored procedure as EXECUTE ADMIN.ORION_ACTIONS
5.To register for an event, please run the stored procedure, EVENT_REGISTER as - EXECUTE ADMIN.EVENT_HANDLING.EVENT_REGISTER(EVENT_NAME)
6.To drop from the event, please run the stored procedure, EVENT_DEREGISTRATION as - EXECUTE ADMIN.EVENT_HANDLING.EVENT_DEREGISTRATION(EVENT_NAME)
7.To add an event, please run the stored procedure, ADD_EVENT as - EXECUTE EXECUTE ADMIN.ADD_EVENT_GUIDE(<EV_NAME>, <EV_CAT>, <EV_DATE(dd-mm-yyyy)>, <EV_VENUE>, <EV_LINK (if available)>)

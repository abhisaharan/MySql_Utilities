DELIMITER $$

CREATE PROCEDURE build_email_list (INOUT email_list varchar(4000))
BEGIN

 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_email varchar(100) DEFAULT "";

 -- declare cursor for employee email
 DEClARE email_cursor CURSOR FOR
 SELECT email FROM employees;

 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET v_finished = 1;

 OPEN email_cursor;

 get_email: LOOP

 FETCH email_cursor INTO v_email;

 IF v_finished = 1 THEN
 LEAVE get_email;
 END IF;

 -- build email list
 SET email_list = CONCAT(v_email,";",email_list);

 END LOOP get_email;

 CLOSE email_cursor;

END$$

DELIMITER ;

-- test the build_email_list stored procedure using the following script:

SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

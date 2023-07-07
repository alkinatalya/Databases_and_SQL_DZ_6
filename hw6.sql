# Задание 1 Создайте процедуру, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
# Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP DATABASE IF EXISTS hw5;
CREATE DATABASE hw5;
USE hw5;
delimiter $$
CREATE PROCEDURE number(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 84600 DO
    SET days = seconds / 84600;
    SET seconds = seconds % 84600;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
delimiter ;

CALL number(123456);

# Задание Создайте функцию, которая  выводит только четные числа от 1 до 10 включительно.
# Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DROP FUNCTION IF EXISTS fanc;
delimiter //
CREATE FUNCTION fanc()
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE result VARCHAR(100) DEFAULT "";
	WHILE I <= 10 DO
		IF (i % 2 = 0) 
			THEN
			SET result = CONCAT(result, " ", i);
			SET i = i + 2;
        ELSE
			SET i = i + 1;
         END IF;
     END WHILE;
RETURN result;
END//
delimiter ;
SELECT fanc();     
     
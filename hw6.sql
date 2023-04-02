CREATE DATABASE hw6;
USE hw6;

-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
DROP FUNCTION IF EXISTS seconds_format;

DELIMITER $$
CREATE FUNCTION seconds_format
(
	num INT
)
RETURNS VARCHAR (100)
DETERMINISTIC
BEGIN
	DECLARE days VARCHAR(3);
    DECLARE hours, minutes, seconds VARCHAR(2);
    DECLARE result VARCHAR(100);
    
    SET days = CAST(FLOOR(num/60/60/24) AS CHAR(3));
    SET hours = CAST(FLOOR(MOD(num/60/60/24, 1)*24) AS CHAR(2));
    SET minutes = CAST(FLOOR(MOD(MOD(num/60/60/24, 1)* 24, 1) * 60) AS CHAR(2));
    SET seconds = CAST(FLOOR(MOD(MOD(MOD(num/60/60/24, 1)* 24, 1)* 60, 1)* 60) AS CHAR(2));
    SET result = CONCAT(days,' days ', hours,' hours ',minutes,' minutes ',seconds,' seconds ');
    
    RETURN result;
END $$

SELECT seconds_format(123456);

-- Выведите только четные числа от 1 до 10 включительно. 

DROP FUNCTION IF EXISTS even_nums;
DELIMITER $$
CREATE FUNCTION even_nums()
RETURNS VARCHAR(50) 
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
    DECLARE num INT DEFAULT 1;
    
    SET num = IF(num % 2 = 0, num, num + 1);
    IF num <= 10 THEN
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, " ");
			END IF;
            SET result = CONCAT(result, num);
            SET num = num + 2;
            UNTIL num > 10
		END REPEAT;
	END IF;
    RETURN result;
END $$

SELECT even_nums();
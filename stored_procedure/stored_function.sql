-- A stored function is a special kind stored program that returns a single value.
-- you list all parameters of the stored function inside the parentheses. By default, all parameters are the IN parameters. You cannot specify IN , OUT or INOUT modifiers to the parameters.

-- if the stored function returns the same result, it is considered deterministic; otherwise, the stored function is not deterministic.

DELIMITER $$

CREATE FUNCTION CustomerLevel(p_creditLimit double) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE lvl varchar(10);

    IF p_creditLimit > 50000 THEN
 SET lvl = 'PLATINUM';
    ELSEIF (p_creditLimit <= 50000 AND p_creditLimit >= 10000) THEN
        SET lvl = 'GOLD';
    ELSEIF p_creditLimit < 10000 THEN
        SET lvl = 'SILVER';
    END IF;

 RETURN (lvl);
END

SELECT
    customerName,
    CustomerLevel(creditLimit) -- function is executed with creditLimit value of each customer passed to function customerLevel.
FROM
    customers
ORDER BY
    customerName;
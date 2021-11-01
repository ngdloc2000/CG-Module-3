use classicmodels;

-- IN
create procedure findCustomerById(IN cusNum int (11))
begin
select *
from customers
where customerNumber = cusNum;
end;

call findCustomerById(103);


-- OUT
DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
CALL GetCustomersCountByCity('NYC',@total);

SELECT @total;

-- INOUT

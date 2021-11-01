use classicmodels;

DELIMITER //
create procedure findAllCustomers()
begin
    select * from customers;
end //
DELIMITER ;

-- gọi thủ tục
call findAllCustomers();


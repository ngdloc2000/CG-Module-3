use product;

-- Tạo view
DELIMITER //
create view product_view as
select pCode, pName, pPrice, pStatus
from products
// DELIMITER ;

select * from product_view;

-- Sửa bản ghi view
update products
set pStatus = 'Còn nửa'
where pCode = 'K';
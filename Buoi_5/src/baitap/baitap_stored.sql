use product;

-- Hiển thị tất cả sản phẩm
delimiter //
create procedure showAllProducts()
begin
    select * from products;
end //
delimiter ;

call showAllProducts();


-- Thêm sản phẩm
delimiter //
create procedure addProduct(IN pCode varchar(255), IN pName varchar(255), IN pPrice varchar(255),
                            IN pAmount varchar(255), IN pDescription varchar(255), IN pStatus varchar(255))
begin
    insert into products (pCode, pName, pPrice, pAmount, pDescription, pStatus)
    values (pCode, pName, pPrice, pAmount, pDescription, pStatus);
end //
delimiter ;

call addProduct('BM', 'Banh My', 15000, 22, 'Bánh mỳ ngon', 'Còn hàng');

-- Sửa sản phẩm theo ID
delimiter //
create procedure editProductById(IN id int, IN pCode varchar(255), IN pName varchar(255), IN pPrice int, IN pAmount int,
                                 IN pDescription varchar(255), IN pStatus varchar(255))
begin
    update products
    set products.pCode        = pCode,
        products.pName        = pName,
        products.pPrice       = pPrice,
        products.pAmount      = pAmount,
        products.pDescription = pDescription,
        products.pStatus      = pStatus
    where products.id = id;
end
// delimiter ;

call editProductById(1, 'Ke', 'Ke', 23000, 21, 'Ke rất ngon', 'Còn nửa');
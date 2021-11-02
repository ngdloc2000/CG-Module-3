use quanlyvattu;

-- 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư
-- với mã vật tư là tham số vào.
delimiter //
create procedure sp_GetAmount(IN vtId int, OUT total int)
begin
    select (tk.tkSoLuongDau + tk.tkSoLuongNhap - tk.tkSoLuongXuat) as 'Số lượng cuối'
    into total
    from tonkho tk
             join vattu v on v.vtId = tk.vtId
    where v.vtId = vtId;
end //
delimiter ;

call sp_GetAmount(1, @total);
select @total;

-- 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
delimiter //
create procedure sp_TongTienXuat(IN vtId int, OUT total bigint)
begin
    select sum(c.donGiaXuat * c.soLuongXuat) as 'Tổng tiền xuất'
    into total
    from chitietphieuxuat c
             join vattu v on c.vtId = v.vtId
    group by v.vtId
    having v.vtId = vtId;
end //
delimiter ;
call sp_TongTienXuat(3, @total);
select @total;

-- 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
delimiter //
create procedure sp_TongSLDat(IN ddhId int, OUT total int)
begin
    select sum(c.soLuongDat) as 'Số lượng đặt'
    into total
    from chitietdonhang c
             join dondathang d on d.ddhId = c.ddhId
    group by d.ddhId
    having d.ddhId = ddhId;
end //
delimiter ;
call sp_TongSLDat(1, @total);
select @total;

-- 4. Tạo SP dùng để thêm một đơn đặt hàng
delimiter //
create procedure sp_ThemDonHang(IN nccId int, IN ddhCode varchar(255), IN ddhNgayDatHang date)
begin
    insert into dondathang(nccId, ddhCode, ddhNgayDatHang) values (nccId, ddhCode, ddhNgayDatHang);
end //
delimiter ;
call sp_ThemDonHang(1, 'DH4', '2021-10-10');
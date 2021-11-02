use quanlyvattu;

-- 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP as
select p.pnId, vtId, soLuongNhap, donGiaNhap, (donGiaNhap * soLuongNhap) as 'Thành tiền'
from chitietphieunhap ctpn
         join phieunhap p on ctpn.pnId = p.pnId;

select *
from vw_CTPNHAP;

-- 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập,
--    đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT as
select p.pnId, vt.vtId, vtName, soLuongNhap, donGiaNhap, (donGiaNhap * soLuongNhap) as 'Thành tiền'
from vattu vt
         join chitietphieunhap ctpn on vt.vtId = ctpn.vtId
         join phieunhap p on ctpn.pnId = p.pnId;

select *
from vw_CTPNHAP_VT;

-- 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng,
-- số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN as
select pn.pnCode,
       pn.pnNgayNhap,
       c.ddhId,
       v.vtId,
       v.vtName,
       c.soLuongDat,
       ctpn.soLuongNhap,
       ctpn.donGiaNhap,
       (donGiaNhap * soLuongNhap) as 'Thành tiền'
from phieunhap pn
         join chitietphieunhap ctpn on pn.pnId = ctpn.pnId
         join vattu v on ctpn.vtId = v.vtId
         join chitietdonhang c on v.vtId = c.vtId and pn.ddhId = c.ddhId;

select *
from vw_CTPNHAP_VT_PN;

-- 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng,
-- ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập,
-- đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT_PN_DH as
select pnCode,
       pnNgayNhap,
       soLuongDat,
       nccName,
       vtName,
       soLuongNhap,
       donGiaNhap,
       (donGiaNhap * soLuongNhap) as 'Thành tiền'
from phieunhap p
         join chitietphieunhap c on p.pnId = c.pnId
         join vattu v on v.vtId = c.vtId
         join dondathang d on d.ddhId = p.ddhId
         join chitietdonhang c2 on c2.ctdhId = c.ccpnId
         join nhacungcap n on n.nccId = d.nccId;

-- 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng,
-- mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập
-- có số lượng nhập > 5.
create view vw_CTPNHAP_loc as
select pn.pnCode, v.vtId, c.soLuongNhap, c.donGiaNhap, (donGiaNhap * soLuongNhap) as 'Thành tiền'
from phieunhap pn
         join chitietphieunhap c on pn.pnId = c.pnId
         join vattu v on c.vtId = v.vtId
where c.soLuongNhap > 500;

-- 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư,
-- số lượng xuất, đơn giá xuất, thành tiền xuất
create view vw_CTPXUAT as
select px.pxCode, v.vtId, c.soLuongXuat, c.donGiaXuat
from phieuxuat px
         join chitietphieuxuat c on px.pxId = c.pxId
         join vattu v on c.vtId = v.vtId;

-- 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư,
-- tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT as
select px.pxCode, v.vtId, v.vtName, c.soLuongXuat, c.donGiaXuat
from phieuxuat px
         join chitietphieuxuat c on px.pxId = c.pxId
         join vattu v on c.vtId = v.vtId;

-- 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng,
-- tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
create view vw_CTPXUAT_VT_PX as
select px.pxCode, px.customerName, c.vtId, c.soLuongXuat, c.donGiaXuat
from phieuxuat px join chitietphieuxuat c on px.pxId = c.pxId

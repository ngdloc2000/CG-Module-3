use quanlytourdulich;

-- Thống kê số lượng tour các thành phố
select cityName, count(tID) as SoLuong
from city c join traveldestinations t on c.cityID = t.cityID
group by cityName;

-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020
select tCode, count(tID)
from tour
where month(tStartDate) = 3 and year(tStartDate) = 2021
group by tCode;

-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
select tCode, tEndDate, count(tID)
from tour
where month(tEndDate) = 4 and year(tStartDate) = 2021
group by tCode, tEndDate;
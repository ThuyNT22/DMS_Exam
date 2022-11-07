--1
CREATE DATABASE SellingPoint;
GO
--2
create table Categories(
    CateID char(6) primary key not null,
    CateName nvarchar(100) not null,
    Description nvarchar(200)
);
create table Parts(
    PartID int primary key identity(1,1),
    PartName nvarchar(100) not null,
    CateID char(6) not null foreign key references Categories(CateId),
    Description nvarchar(1000),
    Price money not null default 0,
    Quantity int default 0,
    Warranty int default 1,
    Photo nvarchar(200) default 'photo/nophoto.png'
);
--3
insert into Categories(CateID,CateName,Description)
values('C00001',N'RAM',N'Bộ nhớ tạm của máy giúp lưu trữ thông tin hiện hành để CPU có thể truy xuất và xử lý'),
('C00002',N'CPU',N'Central Processing Unit hay còn gọi là bộ xử lý trung tâm'),
('C00003',N'HDD',N'Hard Disk Drive là ổ cứng dùng để lưu trữ dữ liệu');
select * from Categories;

insert into Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
values(N'Kingston Fury Beast KF432C16BB/8','C00001',N'Ram Desktop Kingston Fury Beast với thiết kế bắt mắt cùng sức mạnh đến từ thương hiệu đáng tin cậy, sẽ  là một lựa chọn đáng đồng tiền cho người dùng',78,5,36,''),
(N'Kingston 4Gb DDR4 2666 Non ECC','C00001','',50,10,24,''),
(N'TEAM ELITE DDR4 8Gb 2666','C00001','RAM TEAM sử dụng công nghệ DDR4 với Bus 2666MHZ, giúp bạn có thể xử lý nhiều tác vụ trong cùng một lúc. Bạn sẽ không còn lo lắng về hiện tượng giật lag vì tốc độ xử lý của RAM thấp nữa',166,3,60,''),
(N'CPU Intel Core i7-11700K','C00002','3.6GHz turbo up to 5Ghz, 8 nhân 16 luồng, 16MB Cache, 125W',820,20,36,''),
(N'CPU AMD Ryzen 5 5600X, with Wraith Stealth cooler','C00002',N'3.7 GHz (4.6GHz Max Boost) / 35MB Cache / 6 cores, 12 threads / 65W / Socket AM4',550,10,24,''),
(N'CPU Intel Core i5-12400','C00002',N'Up To 4.40GHz, 6 Nhân 12 Luồng,18MB Cache, Socket 1700, Alder Lake',505,8,24,''),
(N'HDD Seagate BarraCuda','C00003',N'1Tb SATA3 7200rpm',99,3,12,''),
(N'Ổ cứng HDD Western Blue 2Tb','C00003',N'SATA3 7200rpm 256Mb WD20EZBZ',146,9,24,''),
(N'HDD Western Digital My Passport Ultra 1Tb','C00003',N'Type-C & USB3.0 (Màu bạc)',179,6,24,'');
select * from Parts;

--4
select * from Parts where Price >= 100;
--5
select * from Parts where CateID in
    (select CateID from Categories where CateName like N'CPU');
create schema quanlyvatlieu;
use quanlyvatlieu;

create table Material
(
    id       int auto_increment primary key not null,
    code     varchar(50),
    name     varchar(50),
    currency varchar(50),
    price    int
);

create table WareHouse
(
    id          int auto_increment primary key not null,
    material_id int,
    firstStock  int,
    import      int,
    export      int,
    foreign key (material_id) references Material (id)
);

create table Supplier
(
    id      int auto_increment primary key not null,
    code    varchar(50) unique,
    name    varchar(50),
    address varchar(200),
    phone   varchar(50) unique
);

alter table Material
    modify code varchar(50) unique;

create table TheOrder
(
    id          int auto_increment primary key not null,
    code        varchar(50) unique,
    orderDate   datetime,
    supplier_id int,
    foreign key (supplier_id) references Supplier (id)
);

create table ReceivedNote
(
    id          int auto_increment primary key not null,
    code        varchar(50) unique,
    importDate  datetime,
    theOrder_id int,
    foreign key (theOrder_id) references TheOrder (id)
);

create table DeliveryNote
(
    id           int auto_increment primary key not null,
    code         varchar(50) unique,
    exportDate   datetime,
    customerName varchar(50)
);

create table OrderDetail
(
    id          int auto_increment not null primary key,
    theOrder_id int,
    material_id int,
    number      int,
    foreign key (theOrder_id) references TheOrder (id),
    foreign key (material_id) references Material (id)
);

create table ReceivedNoteDetail
(
    id int auto_increment not null primary key ,
    receivedNote_id int,
    material_id int,
    number int,
    importPrice int,
    note varchar(500),
    foreign key (receivedNote_id) references ReceivedNote(id),
    foreign key (material_id) references Material(id)
);

create table DeliveryNoteDetail (
    id int auto_increment not null primary key ,
    deliveryNote_id int,
    material_id int,
    number int,
    exportPrice int,
    note varchar(500),
    foreign key (deliveryNote_id) references DeliveryNote (id),
    foreign key (material_id) references Material(id)
);

insert into Material (code, name, currency, price) VALUES ('VT001', 'Wood', 'VND', 24000000);
insert into Material (code, name, currency, price) VALUES ('VT002', 'Cement', 'VND', 14000000);
insert into Material (code, name, currency, price) VALUES ('VT003', 'Sand', 'VND', 10000000);
insert into Material (code, name, currency, price) VALUES ('VT004', 'Steel', 'VND', 20000000);
insert into Material (code, name, currency, price) VALUES ('VT005', 'Brick', 'VND', 8000000);

update Material
set currency = 'Bo'
where id = 1;

insert into WareHouse (material_id, firstStock, import, export) VALUES (1, 3000, 6000, 2000);
insert into WareHouse (material_id, firstStock, import, export) VALUES (2, 300, 6000, 2000);
insert into WareHouse (material_id, firstStock, import, export) VALUES (3, 10000, 40000, 10000);
insert into WareHouse (material_id, firstStock, import, export) VALUES (4, 8000, 4000, 2000);
insert into WareHouse (material_id, firstStock, import, export) VALUES (5, 800000, 4000000, 10000);

insert into Supplier (code, name, address, phone) VALUES ('NCC001', 'Hoa Phat', 'Ha Noi', '01239328581');
insert into Supplier (code, name, address, phone) VALUES ('NCC002', 'Hai Banh', 'Hai Phong', '01239328586');
insert into Supplier (code, name, address, phone) VALUES ('NCC003', 'Kha Banh', 'Lang Son', '01239328321');

insert into TheOrder (code, orderDate, supplier_id) VALUES ('O001', '2022/10/22',1);
insert into TheOrder (code, orderDate, supplier_id) VALUES ('O002', '2022/06/12',2);
insert into TheOrder (code, orderDate, supplier_id) VALUES ('O003', '2022/07/31',3);

insert into ReceivedNote (code, importDate, theOrder_id) VALUES ('RN001', '2022/11/23', 1);
insert into ReceivedNote (code, importDate, theOrder_id) VALUES ('RN002', '2022/7/23', 2);
insert into ReceivedNote (code, importDate, theOrder_id) VALUES ('RN003', '2022/8/23', 3);

insert into DeliveryNote (code, exportDate, customerName) VALUES ('DN001', '2022/12/01', 'Tran Thai Duong');
insert into DeliveryNote (code, exportDate, customerName) VALUES ('DN002', '2023/01/01', 'Nguyen Trung Duc');
insert into DeliveryNote (code, exportDate, customerName) VALUES ('DN003', '2023/01/21', 'Nguyen Minh Hieu');

insert into OrderDetail (theOrder_id, material_id, number) VALUES (1, 1, 300);
insert into OrderDetail (theOrder_id, material_id, number) VALUES (2, 2, 600);
insert into OrderDetail (theOrder_id, material_id, number) VALUES (3, 3, 800);
insert into OrderDetail (theOrder_id, material_id, number) VALUES (1, 4, 900);
insert into OrderDetail (theOrder_id, material_id, number) VALUES (2, 5, 1000);
insert into OrderDetail (theOrder_id, material_id, number) VALUES (3, 1, 200);

insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (1, 1, 500, 1000000, 'red');
insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (2, 2, 600, 2000000, 'blue');
insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (3, 3, 700, 2000000, 'white');
insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (1, 4, 700, 3000000, 'blue');
insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (2, 5, 800, 1000000, 'gray');
insert into ReceivedNoteDetail (receivedNote_id, material_id, number, importPrice, note) VALUES (3, 2, 800, 2000000, 'blue');


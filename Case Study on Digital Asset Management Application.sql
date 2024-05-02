create database CaseStudyonDigitalAssetManagementApplication
use CaseStudyonDigitalAssetManagementApplication


-- creating tables 
create table employees(
employee_id int primary key Identity (101,1) not null,
name Varchar(20) not null,
department varchar(20) not null,
email varchar(20) not null,
password varchar(20) not null)

create table assets(
asset_id int not null primary key identity(201,1),
[name] varchar(20) not null,
[type] varchar(20) not null,
serial_number bigint not null,
purchase_date date not null,
[location] varchar(20) not null,
[stauts] varchar(20) not null ,
constraint CK_Status 
check (stauts in('in use', 'decommissioned','under maintenance')),
owner_id int not null,
foreign key (owner_id) references employees(employee_id))

create table maintenance_records(
maintenance_id int primary key identity(301,1) not null,
asset_id int not null,
foreign key (asset_id) references assets(asset_id),
maintenance_date date not null,
[description] text not null,
cost bigint not null)

create table asset_allocations(
allocation_id int not null primary key identity(401,1),
asset_id int not null,
foreign key (asset_id) references assets(asset_id),
employee_id int not null,
foreign key (employee_id) references employees(employee_id),
allocation_date date not null,
return_date date not null)

create table reservations(
reservation_id int not null primary key identity(501,1),
asset_id int not null,
foreign key (asset_id) references assets(asset_id),
employee_id int not null,
foreign key (employee_id) references employees(employee_id),
reservation_date date not null,
[start_date] date not null,
[end_date] date not null,
[status] varchar(20) not null,
constraint CK_Status1
check([status] in('pending','approved','canceled')))

insert into employees values ('Kavin','maintenance','kavin@gmail.com','Kavin@123'),
							('pradheepa','service','pradee@gmail.com','pradee@123'),
							('Hari','Manager','Hari@gmail.com','hari@123'),
							('kish','maintenance','kish@gmail.com','kish@123')
select * from employees

insert into assets values
('Hp','LAptop',12345,'2024-01-05','chennai','in use',101),
('sony','Laptop',123456,'2024-01-07','Karur','in use',103),
('Sony cam','Camera',3456,'2024-03-10','Trichy','under maintenance',104),
('Apple','Mobile',6789,'2024-05-18','Coimbature','in use',102),
('one plus','Mobile',5678,'2024-05-28','Karur','in use',101)


select * from assets

insert into maintenance_records values 
(203,'2024-07-12','Lens change',50000)

select * from maintenance_records


insert into asset_allocations values
(201,102,'2024-02-07','2024-02-14'),
(202,104,'2024-05-10','2024-05-20')
select * from asset_allocations

insert into reservations values
(204,101,'2024-05-20','2024-05-22','2024-06-13','approved'),
(205,103,'2024-05-30','2024-06-02','2024-06-17','pending')
select * from reservations





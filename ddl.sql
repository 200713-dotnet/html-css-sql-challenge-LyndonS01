-- data definition language

use master;
go

drop database SQLChallengeDb;
go
-- CREATE

create database SQLChallengeDb; --project
go

use SQLChallengeDb;
go

create table Department
(
  ID int not null identity(1,1),
  [Name] NVARCHAR(50) not null,
  [Location] NVARCHAR(50) not null,
  constraint PK_Department_ID primary key (ID)
);

create table Employee
(
  ID int not null identity(1,1),
  FirstName NVARCHAR(50) not null,
  LastName NVARCHAR(50) not null,
  SSN NVARCHAR(9) not null,
  DeptID int not null,
  constraint PK_EmployeeID primary key (ID)
);

create table EmpDetails
(
  ID int not null identity(1,1),
  EmployeeID int not null,
  Salary decimal(18,2) not null default 0.0,
  Address1 NVARCHAR(50) not null,
  Address2 NVARCHAR(50),
  City NVARCHAR(50) not null,
  [State] nvarchar(2) not null,
  Country nvarchar(50)
);

alter table Employee
  add constraint FK_Employee_DeptId foreign key (DeptID) references Department (ID);

alter table EmpDetails
  add constraint FK_EmpDetails_EmployeeID foreign key (EmployeeID) references Employee (ID);


-- populate tables

  -- Department

insert into Department ([Name], [location])
values
('Marketing', 'Culver City, CA'),
('Sales', 'San Diego, CA'),
('IT', 'Denver, CO')

  -- Employee

insert into Employee (FirstName, LastName, SSN, DeptID)
values
('John', 'Doe', '111111111', 1),
('Joseph', 'Smith', '222222222', 1),
('Mary', 'Lamb', '333333333', 2) 

-- EmpDetails

insert into EmpDetails (EmployeeID, Salary, Address1, Address2, City, [State], Country)
values
(1, 50000.0, '123 Main St', '', 'Chicago', 'IL', 'USA'),
(2, 60000.0, '456 Drive Pl', '', 'Seattle', 'WA', 'USA'),
(3, 70000.0, '15376 Potter Cir', 'Unit 200', 'Tampa', 'FL', 'USA')


GO

select 'SQLChallengeDb build done!'

GO


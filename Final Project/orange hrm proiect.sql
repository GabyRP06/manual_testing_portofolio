create database O_HRM;
use O_HRM;
CREATE TABLE users (
    userName VARCHAR(25) NOT NULL,
    userRole VARCHAR(25) NOT NULL,
    employeeName varchar (25) not null,
    status varchar (25) not null
);

-- delete table users
drop table users;

-- create tables
CREATE TABLE users (
    employeeName varchar (25) not null,
    userRole VARCHAR(25) NOT NULL,
    status varchar (25) not null,
    dateOfBirth int,
    dateOfHire int
);


-- modify the type for columns dateOfBirth and dateOfHire from int to date
alter table users modify dateOfBirth date;
alter table users modify dateOfHire date;


CREATE TABLE job (
    jobTitles VARCHAR(25) NOT NULL,
    employmentStatus VARCHAR(25) NOT NULL,
    jobCategory VARCHAR(25) NOT NULL
	
);
drop table job;

CREATE TABLE paygrades (
    nameGrade VARCHAR(25) NOT NULL,
    currency VARCHAR(25) NOT NULL,
    salary int
);

drop table paygrades;

-- add column in the table
alter table users add column employeeLastName varchar (25) not null;
alter table users add column age int;
alter table users add column supervisor varchar (25) not null;
alter table users add column dateOfRetirement date;



-- show table
select * from users;

-- delete column from table
alter table users drop dateOfRetirement;


-- move column employeeLastName after employeeName
ALTER TABLE users MODIFY employeeLastName varchar(25) AFTER employeeName;

-- insert data in the table
insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Pamson','Jim','Admin','Enabled', '1988-01-10', '2020-05-01','35', 'Matin Ion');

-- delete from the table users
delete from users;


insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Hrapciuc', 'Maria', 'Admin', 'Enabled', '1988-01-10', '2021-05-01', '35', 'Martin George');

insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Pamson','Jim','Admin','Enabled', '1988-03-15' , '2020-06-01','35', 'Popescu Ion'),
('Jonson','Jon','ESS', 'Enabled','1989-05-08','2019-05-15', '34', 'Postelnicu Jean'),
('Popescu','Jon', 'Admin',' Enabled','1987-07-05', '2022-05-09', '36', 'Postelnicu Jean'),
('Georgia', 'Ilona','Ess','Disabled','1979-03-25', '2007-08-10', '44', 'Postelnicu Jean'),
('Elena','Maria','ESS','Enabled','1974-01-18','2000-01-09','49','Martin George'),
('Ghita','Georgeta','ESS ','Enabled','1973-10-10','2001-12-12','50','Popescu Ion'),
('Iurie', 'Amelia','Admin','Enabled','1977-12-13','2002-10-10','46','Popescu Ion'),
('Ionescu', 'Marian','ESS','Enabled','1981-03-08','2000-12-10','42','Popescu Ion');

insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Harhata', 'Maria', 'Admin', 'Enabled', '1984-01-10', '2021-05-01', '39', 'Martin George');

insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Georgescu', 'Maria', 'Admin', 'Enabled', '1985-01-11', '2021-05-01', '38', 'Martin George');

insert into users (employeeName, employeeLastName, userRole, status, dateOfBirth, dateOfHire, age, supervisor)
values ('Calinescu', 'Ioan', 'Admin', 'Enabled', '1985-01-11', '2000-01-09', '38', 'Martin George');

-- show table
select * from users;

-- add column in the table users
alter table users add column gender varchar (2) ;

insert into job (jobTitles, employmentStatus, jobCategory)
values ('Account Assistant','Full Time','Technicians'),
('Chief Financial Officer' ,'Part Time ','Professionals'),
('Chief Technical Officer','Full Time ','Professionals'),
('Database Administrator','Full Time Remote','Technicians'),
('Finance Manager','Full Time ','Manager'),
('HR Associate','Freelancer','Professionals'),
('IT Manager','Full Time', 'Manager'),
('Network Administrator','Full Time','Technicians'),
('Payroll Administrator','Full Time', 'HR Admin' ),
('IT Specialist','Freelancer','QA Engineer');


select * from job;

insert into paygrades (nameGrade, currency, salary)
values ('Grade1', 'USD', 4000),('Grade2','EUR','4050'), ('Grade3','GBP','5000'), ('Grade4','CAD','5500'), ('Grade5','ILS','100000'),
('Grade6','NOK','100000'),('Grade7','UAH','20000'),('Grade8','RUB','2000000'),('Grade9','AUD','7000'),('Grade10','TRY','200000');

select * from paygrades;

-- create a primary key and add column userid in users table
alter table users add column userId int primary key auto_increment;

select * from  users;

-- move column  primary key 
alter table users modify column userId int auto_increment first;

select * from  users;

CREATE TABLE workShifts (
    userID int not null auto_increment,
    workShiftsName VARCHAR(25) NOT NULL,
	assignedEmployees VARCHAR(25) NOT NULL,
    hoursPerDay int,
    holidayStart  date,
    holidayEnd date,
    primary key (userID),
    constraint fk_workShifts_users foreign key (userId) references users(userId)
);

CREATE TABLE paygrades (
    userID int not null auto_increment,
    nameGrade VARCHAR(25) NOT NULL,
	currency VARCHAR(25) NOT NULL,
    salary int,
    primary key (userID),
    constraint fk_paygrades_users foreign key (userId) references users(userId)
);


CREATE TABLE job (
    userID int not null auto_increment,
    jobTitles VARCHAR(25) NOT NULL,
	employmentStatus VARCHAR(25) NOT NULL,
    jobCategory VARCHAR(25) NOT NULL,
    primary key (userID),
    constraint fk_job_users foreign key (userId) references users(userId)
);



-- delete column from table
alter table workshifts drop assignedEmployees;

select * from workshifts;

insert into workshifts (workShiftsName, hoursPerDay, holidayStart, holidayEnd)
values ('Morning Shift','8','2023-04-06','2023-04-14'),
('Morning Shift','8','2023-05-06','2023-05-14'),
('Intermediary Shift','8','2023-06-06','2023-06-10'),
('Intermediary Shift','8','2023-04-06','2023-04-14'),
('Evening Shift','8','2023-05-06','2023-05-14'),
('Evening Shift','8','2023-05-06','2023-05-14'),
('Morning Shift','8','2023-07-06','2023-07-14'),
('Morning Shift','8','2023-08-01','2023-08-14'),
('Intermediary Shift','8','2023-10-06','2023-10-14'),
('Evening Shift','8','2023-11-06','2023-11-20');

insert into workshifts (workShiftsName, hoursPerDay, holidayStart, holidayEnd)
values ('Morning Shift','6','2023-04-06','2023-04-14');


select * from workshifts;

-- update tabela users
update users set gender = "f" where employeeLastName like '%a';
update users set gender = "m" where employeeLastName like '%m';
update users set gender = "m" where employeeLastName like '%n';

-- select from din tabela users 
select * from users where employeeName in ("Jon","Mary");
select * from users where employeeName not in ("Jon","Mary");
select * from users where employeeName like 'a%';
select * from users where employeeName like 'j%';
select * from users where employeeName like '%on';
select * from users where employeeName like '%o%';
select * from users where employeeName like '%on' and status  like 'd%';
select * from users where employeeName like 'j%' and status  like '%ed';
select * from users where status ='Disabled';
select * from users where status ='Enabled';
select * from users where Supervisor ='Postelnicu Jean';
select * from users where Supervisor ='Martin George';
select * from users where gender = 'f';
select * from users where gender = 'm';



select * from workshifts where holidayEnd like '%20';
select * from workshifts where holidayEnd like '%08%';
select * from workshifts where holidayStart like '%08%';
select * from workshifts where holidayStart like '%06%';
select * from workshifts where workShiftsName = 'Morning Shift';
select * from workshifts where workShiftsName = 'Intermediary Shift';
select * from workshifts where workShiftsName = 'Evening Shift';
select * from workshifts where hoursPerDay = '6';


-- filtrare compusa
select * from users where employeeName = 'Jon' and userRole = 'Admin';
select * from users where employeeName = 'Jon' or userRole = 'Admin';
select * from users where employeeLastName = 'Jon' and userRole = 'ESS';
select * from users where status = 'Disabled';
select * from users where status = 'Enabled' and gender = 'f';


-- join

select * from users;
select * from users cross join workshifts;
select * from users inner join workshifts on users.userid = workshifts.userid;
select * from users left join workshifts on users.userId = workshifts.userid;
select * from users right join workshifts on users.userId = workshifts.userid;




-- SQL extras- order by

select * from users;
select * from users order by age;
select * from users order by age desc;
select * from users order by age desc limit 3;
select max(age) from users;
select min(age) from users;
select count(*) from users;

-- SQL extras- group by

-- vezi nr angajati care in functie de data angajarii 

select count(userId), dateOfHire
from users
group by dateOfHire;

-- afisati numarul total si userid-urile celor mai vechi angajati
select count(*) from users where dateOfHire =(select min(dateOfHire) from users);
select userId from users where dateOfHire =(select min(dateOfHire) from users);

-- afisati numarul total si userid-urile celor mai noi angajati
select count(*) from users where dateOfHire =(select max(dateOfHire) from users);
select userId from users where dateOfHire =(select max(dateOfHire) from users);

-- extragere car eeste salariu cel mai mare, cel mai mic si mediu din companie
select MAX(salary) from paygrades;
select Min(salary) from paygrades;
select AVG(salary) from paygrades;

-- marire salariu cu 10% pt angajatii cu salariul egal cu 4000

select salary+10*salary/100 from paygrades where salary = '4000';

-- actualizare in baza de date salariul marit
update paygrades set salary = salary+10*salary/100 where salary = '4000';

select * from paygrades;


-- extragere nr angajatii grupati dupa salariu

select count(userId), salary
from paygrades
group by salary;

-- extragere angajati care au salariul mai mare de 100000
select count(userId), salary
from paygrades
group by salary
having salary>100000;

-- extragere angajati platiti in moneda USD
select count(userId), currency
from paygrades
group by currency
having currency = 'USD';

select count(userId), employmentStatus
from job
group by employmentStatus
having employmentStatus = 'Full Time';


select * from job where employmentStatus = 'Full Time';









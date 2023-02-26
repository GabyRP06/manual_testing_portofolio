create database orangehrm;

CREATE TABLE jobTitles (
    jobTitles VARCHAR(25) NOT NULL,
    jobDescription VARCHAR(25) NOT NULL
);
CREATE TABLE payGrades (
    nameGrade VARCHAR(25) NOT NULL,
    currency VARCHAR(25) NOT NULL
);
CREATE TABLE employmentStatus (
    employmentStatus VARCHAR(25) NOT NULL
);
CREATE TABLE jobCategories (
    jobCategories VARCHAR(25) NOT NULL
);

CREATE TABLE workShifts (
    workShiftsName VARCHAR(25) NOT NULL,
    fromhour VARCHAR(25) NOT NULL,
    tohour VARCHAR(25) NOT NULL,
    hoursPerDay VARCHAR(25) NOT NULL
);

-- modificare coloane din tabela nume si data type
alter table workshifts modify fromHour time;
alter table workshifts modify toHour time;
alter table workshifts modify hoursPerDay int;

CREATE TABLE users (
    userName VARCHAR(25) NOT NULL,
    userRole VARCHAR(25) NOT NULL,
    employeeName varchar (25) not null,
    status varchar (25) not null
);

-- adaugare coloane in tabela users
alter table users add column dateOfBirth date;
alter table users add column dateOfHire date;
alter table users add column dateOfRetirement date;
alter table users add column employeeLastName varchar (25) not null;
alter table users add column age int;



-- stergere coloane din tabela users
alter table users drop dateOfRetirement;
alter table users drop employeeLastName;
alter table users drop dateOfBirth;
alter table users drop dateOfHire;
-- inserare date in tabela
insert into users (userName, userRole, employeeName, status,age)
values ('jim.pamson','Admin', 'Jim Pamson','enabled','35');

insert into users (userName, userRole, employeeName, status,age)
values ('Jon.Jonson','ESS','Jon Jonson','enabled','38'),('mary.hrapciuc','ESS','Mary Hrapciuc','enabled','40'),
('martin.ion','Admin','Martin Ion','enabled','29'),('jon.popescu','ESS','Jon Popescu','enabled','35');

insert into users (userName, userRole, employeeName, status,age)
values ('georgia.ilona','Admin', 'Georgia Ilona','enabled','44'),
('elena.maria','ESS', 'Elena Maria','enabled','49'),
('georgeta.ghita','ESS ', 'Georgeta Ghita','enabled','50'),
('iulia.amelia','Admin', 'Iulia Amelia','enabled','46'),
('ionescu.marian','ESS', 'Ionescu Marian','enabled','42');



-- update status din enabled in disabled in tablela users
update users set status ='disabled';

-- update status din disabled in enabled pt Martin Ion
update users set status = "enabled" where employeeName = 'Martin Ion';

select * from users;


-- vizualizate tabela users
select * from users;

-- stergere tabela users
delete from users;

-- stergere tabela jobcategories
truncate table jobcategories;

-- inserare valori in tablela workshifts 
insert into workshifts (workShiftsName, fromHour, toHour, hoursPerDay)
values ('morning shift',"07:00","15:00",8);

-- stergere din tabela workshifts
delete from workshifts;

-- reinserarea valori in tabela workshifts
insert into workshifts (workShiftsName, fromHour, toHour, hoursPerDay)
values ('morning shift',"07:00","15:00",8),
('day shift',"14:00","21:00",8),
('night shift',"20:00","08:00",12);


-- inserare valori in tabela payGrade
insert into paygrades (nameGrade, currency)
values ('grade1', 'USD'),('grade2','EUR'), ('grade3','GBP'), ('grade4','CAD'), ('grade5','ILS'),
('grade6','NOK'),('grade7','UAH'),('grade8','RUB'),('grade9','AUD'),('grade10','TRY');

select * from payGrades;

-- inserare valori in tabela jobtitles
insert into jobtitles (jobTitles, jobDescription)
values ('Account Assistant','xxx'),('Chief Financial Officer' ,'yyy'),('Chief Technical Officer','aaa'),('Database Administrator','sss'),
('Finance Manager','ddd'),('HR Associate','eee'),('IT Manager','ttt'),('Network Administrator','fff'),('Payroll Administrator','ggg'),
('Support Specialist','ddd');

select * from jobtitles;

insert into jobcategories (jobcategories)
values ('Operatives');

insert into jobcategories (jobcategories)
values ('It'), ('Sales'), ('Professionals'), ('Tehnicians'), ('Officials and Managers'),( 'Craft Workers'), ('Services Workers'),(' HR Workers'), ('Logistics Workers');

-- selectii total coloane, set de coloane
select * from jobcategories;
select * from jobtitles;
select * from users;
select userRole, employeeName from users;
select jobtitles from jobtitles;

-- diverse filtrari din tabela users 
select * from users where employeeName in ("Jon","Mary");
select * from users where employeeName not in ("Jon","Mary");
select * from users where employeeName like 'a%';
select * from users where employeeName like 'j%';
select * from users where employeeName like '%on';
select * from users where employeeName like '%o%';

select * from users where employeeName like '%on' and status  like 'd%';
select * from users where employeeName like 'j%' and status  like '%ed';

-- filtrare compusa
select * from users where employeeName = 'Jon' and userRole = 'Admin';
select * from users where employeeName = 'Jon' or userRole = 'Admin';
select * from users where employeeName = 'Jon' and userRole = 'ESS';
select * from users where employeeName = 'Jon' or userRole = 'ESS';

-- functii agregate
select sum(age) from users;
select avg(age) from users;
select min(age) from users;
select max(age) from users;
select count(*) from users;

-- creare cheie primara si adaugare coloana userid
alter table users add column userId int primary key auto_increment;

-- vizualizare coloane din tabela users, describe
desc users;

select * from users;

-- mutare coloana primary key 
alter table users modify column userId int auto_increment first;

-- creare cheie secundara

create table managers(
managerId int not null auto_increment,
managerName varchar(45) not null,
managerRole varchar(45) not null,
age int not null,
userId int not null,
primary key (managerId),
constraint fk_managers_users foreign key (userId) references users(userId)
);

select *from managers;
insert into managers (managerName, managerRole,age,userId)
values('Popescu', 'Admin','50',5),('Iordanescu','ESS','50',8),('Iordan','ESS','45',7);

insert into managers (managerName, managerRole,age,userId)
values('Alebescu', 'Admin','50',1),('Iordachescu','ESS','50',2),('Georgescu','Admin','45',3),('Popa','Admin', '40',4),
('Colacel','Admin','42',6),('Craciun','Admin', '48',9),('Birsan','ESS','39',10);

-- join

select * from users;
select * from users cross join managers;
select * from users inner join managers on users.userid = managers.userid;
select * from users left join managers on users.userId = managers.managerid;
select * from users left join managers on users.userId  = managers.managerid where users.userId  is null;
select * from users right join managers on users.userId = managers.managerid;
select * from users right join managers on users.userId = managers.managerid is null;
select * from users right join managers on users.userId = managers.managerid where users.userid is not null;

-- SQL extras- order by

select * from users;
select * from users order by age;
select * from users order by age desc;
select * from users order by age desc limit 3;
select max(age) from users;
select min(age) from users;

-- SQL extras- group by
select u.userId, userName, userRole, count(managerId)
from users u inner join managers m on u.userid = m.userid
group by u.userId, userName, userRole;

select u.userId, userName, userRole, count(managerId)
from users u inner join managers m on u.userid = m.userid
group by u.userId, userName, userRole
having count(managerId)>0;


select * from users u inner join managers m on u.userId = m.userId;




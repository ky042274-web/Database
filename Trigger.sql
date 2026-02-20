create database employee_imp;
use employee_imp;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100)
);
create table Emp_trigger(
log int auto_increment primary key,
employee_id int,
messege VARCHAR(100),
Created_at timestamp default current_timestamp);

delimiter $$

-- create trigger before_insert
--  before insert on employees

 create trigger after_insert
 after insert on employees
 for each row
 
begin
	insert into Emp_trigger(employee_id,messege)
    values (New.employee_id,concat('New employee added:',new.name));
    end$$
 delimiter ;
 delete from employees where employee_id = 1;
 
 insert into employees(name,department)
 values ("Manvit","Riddhi"),
 ("Aman","Komal")
 ;
 
 select * from Emp_trigger; 
 
delimiter $$
create trigger after_delete
after delete on employees
for each row
begin 
	insert into Emp_trigger(employee_id,messege)
    value (old . employee_id,concat('employee deleted:',old.name));
    end$$
    delimiter ;
    
    delete from employees where employee_id = 1;
    
  delimiter $$
  create trigger after_update 
  after update on employees
  for each row 
  begin
	insert into Emp_trigger(employee_id,messege)
	value (new.employee_id,concat('employee update:',new.name));
	end$$
	delimiter ; 
    
update  employees set name="Shipra" where employee_id = 2; 
    




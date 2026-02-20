Create database transation_tcl;
use transation_tcl;

start transaction;
update bankaccount
set balanace= balanace+ 1000
where id=4;

commit;
select * from bankaccount;

#rollback procedure
delimiter $$
create procedure accounttransaction()
begin
	start transaction;
    update banckaccount
    set balanace= balanace-5000
    where id =4;
    if (select balanace from bankaccount where id=4)<3000 then rollback;
		signal sqlstate'45000'
		set message_text='insufficient balanace.';
	end if;
	update banckaccount set balanace = balanace + 5000
	where id=2;
    
	commit;
end $$
delimiter ;
select * from bankaccount;

call accounttransaction();

#transaction in SQL
create database transaction_tcl;
use transaction_tcl;
Create table bankaccount( id int primary key, name varchar(50), balanace int);

insert into bankaccount values 
(1,'shipra',5000),
(2,'rahul',6000),
(3, 'khushi',4000),
(4,'vivek',10000);

start transaction;
update bankaccount
set balanace= balanace+ 1000
where id=4;

commit;
select * from bankaccount;

#rollback procedure
delimiter $$
create procedure TCLTRANSATION()
begin
	start transaction;
    update bankaccount
    set balanace= balanace-5000
    where id =4;
    if (select balanace from bankaccount where id=4)<3000 then 
		rollback;
		signal sqlstate'45000'
		set message_text='insufficient balanace.';
	end if;
	update bankaccount set balanace = balanace + 5000
	where id=2;
    
	commit;
end $$
delimiter ;
select * from bankaccount;

call TCLTRANSATION ();



# Apply multiple tranaction using single procedure and savepoint

delimiter $$
create procedure abctransaction(
in from_account int,
in to_account int,
in transfer_amount int)

begin
	start transaction;
	update bankaccount
	set balanace=balanace - transfer_amount
	where id=from_account;

	if(select balanace from  bankaccount where id=from_account)<0 then 
	rollback;
	signal sqlstate '45000'
	set message_text ='Insufficient balance.';
	end if;

	update bankaccount
	set balanace=balanace + transfer_amount
	where id=to_account;

	commit;
    

end $$

delimiter ;
select * from bankaccount;

call abctransaction(4,1,1000);


    
    
    
    
    









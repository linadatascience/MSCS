create table CheckingAccount (
	Acct_No int(10) references Account(Acct_No),
	Check_Limit numeric(10,2) not null,
     primary key(Acct_No));
insert into CheckingAccount (Acct_No, Check_Limit) values (3, 1000);
insert into CheckingAccount (Acct_No, Check_Limit) values (4, 3000);
insert into CheckingAccount (Acct_No, Check_Limit) values (9, 4500);
insert into CheckingAccount (Acct_No, Check_Limit) values (10, 1500);
insert into CheckingAccount (Acct_No, Check_Limit) values (12, 1500);
insert into CheckingAccount (Acct_No, Check_Limit) values (14, 2000);
insert into CheckingAccount (Acct_No, Check_Limit) values (16, 1000);
insert into CheckingAccount (Acct_No, Check_Limit) values (22, 3000);
insert into CheckingAccount (Acct_No, Check_Limit) values (23, 1500);
insert into CheckingAccount (Acct_No, Check_Limit) values (26, 3000);
insert into CheckingAccount (Acct_No, Check_Limit) values (27, 4500);
insert into CheckingAccount (Acct_No, Check_Limit) values (28, 1000);

create table SavingAccount (
	Acct_No int(10) references account(Acct_No),
	Interest_Rate numeric(5,2),
	Trans_Limit int(2),
    primary key(Acct_No));
    
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (1, 3.2, 10);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (2, 2.8, 8);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (5, 3.0, 15);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (6, 3.4, 10);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (7, 4.5, 12);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (8, 3.2, 8);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (11, 2.9, 12);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (13, 2.8, 10);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (17, 3.2, 10);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (20, 3.4, 12);
insert into SavingAccount (Acct_No, Interest_Rate, Trans_Limit) values (21, 3.2, 8);
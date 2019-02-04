create table transaction
(Trans_ID mediumint not null AUTO_INCREMENT primary key,
Acct_No int(10) references account(Acct_No),
Trans_Date date,
Trans_Type varchar(10) check(Trans_Type in ('Deposit', 'Withdraw', 'Transfer')),
Trans_Amt numeric(10,2),
Trans_Cmts varchar(50)
);

insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (20, '2013-05-01', 'Deposit', 18500, 'saving account deposit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (13, '2013-07-09','Withdraw', 5500, 'home expense');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (4, '2013-07-21', 'Withdraw', 8000,'buy furniture');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (29, '2013-12-21', 'Deposit', 6800, 'make payment for loan');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2014-12-04', 'Transfer', 2548, 'pay credit card');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (7, '2014-03-13', 'Deposit', 3200, 'divident from CD');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (27, '2014-05-27', 'Deposit', 2800, 'salary deposit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (25, '2014-09-28', 'Deposit', 4000, 'loan payment');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (24, '2014-10-24', 'Deposit', 5500, 'Loan payment');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2014-12-25', 'Deposit', 2500, 'salary payment');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2014-12-25', 'Withdraw', 1500, 'car repaire');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (5, '2014-12-28', 'Deposit', 12000, '2014 bonus');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (21, '2015-01-06', 'Deposit', 5400, 'business benefit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (1, '2015-01-26', 'Withdraw', 5000, 'tuition payment');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (1, '2015-02-04', 'Deposit', 2000, 'living expense');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (8, '2015-03-05', 'Dopsit', 3200, 'contract income');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (24, '2015-03-15', 'Deposit', 3000, 'loan payment');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (22, '2015-04-05', 'Deposit', 5500, 'contract income');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (17, '2015-04-23', 'Withdraw', 6400, 'house repairement');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (14, '2015-05-10', 'Deposit', 2250, 'salary deposit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (11, '2015-06-04', 'Withdraw', 8800, 'house renovate');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (9, '2015-06-11', 'Deposit', 1500, 'salary deposit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (10, '2015-07-08', 'Deposit', 1200, 'salary deposit');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (16, '2015-07-10', 'Withdraw', 500, 'grocery shopping');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (12, '2015-07-11', 'Withdraw', 3800, 'car maintenance');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (11, '2015-07-18', 'Withdraw', 4400, 'kitchen appliance');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2015-07-18', 'Deposit', 5000, 'contract income');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2015-07-22', 'Withdraw', 300, 'grocery shopping');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2015-07-25', 'Withdraw', 200, 'cloth buying');
insert into Transaction (Acct_No, Trans_Date, Trans_Type, Trans_Amt, Trans_Cmts) values (3, '2015-07-28', 'Deposit', 1000, 'contract income');

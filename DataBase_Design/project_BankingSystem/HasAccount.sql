create table HasAccount (
	Cust_ID int(10) references customer(Cust_Id),
	Acct_No int(10) references account(Acct_No),
	Open_Date DATE,
    primary key(Cust_ID, Acct_No));
    
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (22, 16, '2012-10-16');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (5, 5, '2011-07-12');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (27, 10, '2012-05-29');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (15, 5, '2011-07-12');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (27, 7, '2011-12-11');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (6, 8, '2012-01-03');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (25, 19, '2012-12-25');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (22, 15, '2012-09-04');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (3, 9, '2012-03-05');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (4, 9, '2012-03-05');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (4, 6, '2011-10-06');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (1, 11, '2012-06-05');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (8, 12, '2012-07-23');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (20, 21, '2013-02-13');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (17, 18, '2012-12-23');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (9, 3, '2011-03-02');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (2, 28, '2013-12-25');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (7, 1, '2011-01-12');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (10, 17, '2012-12-19');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (11, 2, '2011-01-21');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (13, 4, '2011-05-30');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (3, 13, '2012-08-17');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (12, 14, '2012-08-21');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (14, 20, '2013-01-29');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (16, 22, '2013-03-02');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (18, 23, '2013-05-21');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (19, 24, '2013-07-07');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (21, 25, '2013-09-18');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (23, 26, '2013-10-12');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (25, 30, '2013-11-18');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (28, 29, '2013-11-18');
insert into HasAccount (Cust_ID, Acct_No, Open_Date) values (26, 27, '2013-10-15');




create table Account (
Acct_No mediumint not null AUTO_INCREMENT primary key,
Balance numeric(10,2) not null,
branch_ID int(5) not null references branch(Branch_ID),
Acct_Type varchar(2) check(Acct_Type in('S','C','L'))
);
insert into Account (Balance, Branch_ID, Acct_Type) values (55000, 5, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (28000, 5, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (12020.90, 11, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (31753.53, 2, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (96500, 6, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (32500, 11, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (123810, 5, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (59243.86, 11, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (13681.28, 2, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (647.22, 9, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (93334.95, 9, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (10249.96, 2, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (64514.28, 10, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (58969.46, 7, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (75000, 4, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (3881.93, 1, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (78331, 4, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (190000, 10, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (150000, 4, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (84062, 7, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (86000, 5, 'S');
insert into Account (Balance, Branch_ID, Acct_Type) values (3400, 4, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (85000, 4, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (250000, 3, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (93011, 3, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (17288.37, 2, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (5532, 7, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (23948.58, 5, 'C');
insert into Account (Balance, Branch_ID, Acct_Type) values (350000, 3, 'L');
insert into Account (Balance, Branch_ID, Acct_Type) values (268000, 3, 'L');

create table customer
(Cust_ID mediumint not null AUTO_INCREMENT primary key,
	Fname VARCHAR(25),
	Lname VARCHAR(25),
	Street VARCHAR(30),
	City VARCHAR(25),
	State VARCHAR(2),
	Zipcode VARCHAR(10),
	Tele_No VARCHAR(14));

create table account
(Acct_No mediumint not null AUTO_INCREMENT primary key,
Balance numeric(10,2) not null,
branch_ID varchar(5) not null references branch(Branch_ID),
Acct_Type varchar(2) check(Acct_Type in('S','C','L')));

create table Hasaccount
(Cust_ID int(10) references customer(Cust_Id),
	Acct_No int(10) references account(Acct_No),
	Open_Date DATE,
    primary key(Cust_ID, Acct_No));

create table branch
(Branch_ID int(5) primary key,
	Name VARCHAR(25) not null,
	Street VARCHAR(30),
	City VARCHAR(20),
	State VARCHAR(2),
	Zipcode VARCHAR(10));

create table checkingaccount
(Acct_No int(10) references Account(Acct_No),
	Check_Limit numeric(10,2) not null,
	primary key(Acct_No));

create table savingsaccount
(Acct_No int(10) references account(Acct_No),
	Interest_Rate numeric(5,2),
	Trans_Limit int(2),
    primary key(Acct_No));

create table loanaccount
(Acct_No int(10) references account(acct_no),
	Loan_Amt numeric(10),
	Term int(2),
	Interest_Rate numeric(4,2),
	Description varchar(40)
    primary key(acct_no));

create table transaction
(Trans_ID mediumint not null AUTO_INCREMENT primary key,
Acct_No int(10) references account(Acct_No),
Trans_Date date,
Trans_Type varchar(3) check(Trans_Type in ('Deposit', 'Withdraw', 'Transfer')),
Trans_Amt numeric(10,2),
Trans_Comds varchar(50)
);


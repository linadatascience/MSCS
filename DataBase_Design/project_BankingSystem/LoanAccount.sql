create table LoanAccount (
	Acct_No int(10) references account(acct_no),
	Loan_Amt numeric(10),
	Term int(2),
	Interest_Rate numeric(4,2),
	Description varchar(40)
    primary key(acct_no));
    
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (15, 150000, 10, 5.4, 'House Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (18, 250000, 20, 3.8, 'House Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (19, 200000, 8, 7.8, 'Business Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (24, 250000, 30, 4.4, 'House Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (25, 120000, 3, 5.4, 'Business Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (29, 350000, 30, 4.8, 'House Loan');
insert into LoanAccount (Acct_No, Loan_Amt, Term, Interest_Rate, Description) values (30, 280000, 25, 4.2, 'House Loan');

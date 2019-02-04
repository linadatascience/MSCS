create table staff
(ssn   		varchar(11) primary key,
 lname 		varchar(25),
 fname 		varchar(25),
 address 	varchar(30),
 city		varchar(20),
 state		varchar(2),
 zipcode	varchar(10),
 telephone	varchar(14),
 hourly_rate	float(4,2),
 supervisor	 varchar(11) NULL  references staff(ssn),
 shift		int(1));


create table maincourse
(maincourse_id  varchar(2) primary key,
 description    varchar(40));

create table dessert
(dessert_id  varchar(2) primary key,
 description    varchar(40));

create table menu
(menu_id varchar(2) primary key,
 maincourse_id varchar(2) references maincourse(maincourse_id),
 dessert_id  varchar(2) references dessert(dessert_id),
 style       int(1));

create table dish
(dish_id  varchar(5) primary key,
 description varchar(40),
 preptime float(4,2),
 servicetype int(2));

create table event
(event_id  varchar(6) primary key,
 event_date date,
 event_time varchar(10),
 start_hour int(2),
 location varchar(40),
 event_type varchar(20),
 customer_id  varchar(4),
 menu_id varchar(2) references menu(menu_id),
 plates	 int(5),
 duration float(4,2));

create table event_staff
(event_id varchar(6) references event(event_id),
 ssn  varchar(11) references staff(ssn),
 primary key (event_id,ssn));

create table course_item
(maincourse_id varchar(2) references maincourse(maincourse_id),
 dish_id       varchar(5) references dish(dish_id),
 primary key (maincourse_id,dish_id));

drop table presentdiagnosis;
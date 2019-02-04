insert into staff
values('013-23-2121','Smith','Wilma','1023 High St','Boston','MA','02115','(617) 289-3212',26.00,'',1);
insert into staff
values('014-21-2331','Williams','Warren','213 West St','Boston','MA','02120','(617) 292-1212',20.00,'013-23-2121',1);
insert into staff
values('015-22-1212','Roth','Earl','542 Chestnut St','Natick','MA','01721','(781) 231-1211',18.50,'013-23-2121',2);
insert into staff
values('982-12-1212','Yolenda','Meredith','4832 Pleasant St','Boston','MA','02132','(617) 292-8432',19.00,'013-23-2121',2);
insert into staff
values('374-32-2121','Taylor','Ursula','352 Pike St','Framingham','MA','01701','(781) 212-2123',17.34,'982-12-1212',1);
insert into staff
values('014-54-4412','Lo','Ili','56 Harrison Ave.','Boston','MA','02121','(617) 867-1721',21.00,'013-23-2121',1);
insert into staff
values ('022-21-2352','Himenda','Herbert','1298 South Bay Road','Natick','MA','01721','(781) 231-2322',15.00,'982-12-1212',2);
insert into staff
values ('986-21-2721','Well','F.D.','863A Main St','Fitchburg','MA','01420','(978) 345-2392',19.00,'982-12-1212',1);

insert into maincourse
values('10','Chicken Picatta with Rice');
insert into maincourse
values('11','Chicken Picatta with Potato');
insert into maincourse
values('20','Pasta Primavera');
insert into maincourse
values('21','Baked Ziti');
insert into maincourse
values('30','Beef au Jous');
insert into maincourse
values('40','Omlet with Homefries');
insert into maincourse
values('41','French Toast');
insert into maincourse
values('42','Eggs Benedict');
insert into maincourse
values('89','Party Platter');

insert into dessert
values('1','Cheesecake w/ Strawberries');
insert into dessert
values('2','Chocolate Cake');
insert into dessert
values('3','Ice Cream');
insert into dessert
values('4','Fruit Torte');
insert into dessert
values('5','Chocolate Mousse');
insert into dessert
values('6','Cannoli');

insert into menu
values('01','10','1',2);
insert into menu
values('02','20','2',2);
insert into menu
values('03','30','1',2);
insert into menu
values('04','41','',2);
insert into menu
values('05','40','',2);
insert into menu
values('06','42','',2);
insert into menu
values('10','89','2',3);

insert into dish
values('AC-1','Rice Pilaf',0.4,3);
insert into dish
values('AC-4','Baked Potato',0.5,3);
insert into dish
values('AC-7','Scalloped Potato',0.7,3);
insert into dish
values('AP-1','Mixed Veggies',1,2);
insert into dish
values('AP-2','Stuffed Mushrooms',0.7,2);
insert into dish
values('AP-3','Fruit Cup',0.5,1);
insert into dish
values('AP-5','Cheese Tray',0.3,2);
insert into dish
values('AP-6','Cracker Tray',0.3,2);
insert into dish
values('BF-1','Steak',1,3);
insert into dish
values('BF-2','Steak Tips',1.05,3);
insert into dish
values('BF-3','Beef',1.8,3);
insert into dish
values('CX-1','Chicken Picatta',1.2,3);
insert into dish
values('CX-2','Chicken Cordon Bleu',2,3);
insert into dish
values('DK-1','Punch Bowl',0.2,2);
insert into dish
values('PA-1','Pasta Primavera',0.5,3);
insert into dish
values('PA-2','Lasagna',1.5,3);
insert into dish
values('PA-3','Baked Ziti',1.25,3);
insert into dish
values('PA-4','Spaghetti',0.5,3);
insert into dish
values('PA-5','Manicotti',1.25,3);
insert into dish
values('SA-1','Salad Bar',1,2);
insert into dish
values('SA-2','Tossed Salad',0.5,3);
insert into dish
values('SA-3','Ceaser Salad',0.5,3);
insert into dish
values('SP-1','Minestrone',0.3,1);
insert into dish
values('SP-2','Chicken Noodle',0.3,2);
insert into dish
values('VG-1','Vegetable Medley',0.4,3);
insert into dish
values('VG-2','Brocolli',0.3,3);
insert into dish
values('VG-3','Green Beans',0.2,3);
insert into dish
values('VG-4','Sweet Peas',0.3,3);
insert into dish
values('VM-1','Veggie Stir Fry',0.75,3);
insert into dish
values('BK-1','Omlet',0.01,4);
insert into dish
values('BK-2','French Toast',0.1,4);
insert into dish
values('BK-3','Eggs Benedict',0.2,4);
insert into dish
values('BK-4','Homefries',0.1,4);
insert into dish
values('BK-5','Sausage',0.1,4);
insert into dish
values('BK-6','Bacon',0.1,4);
insert into dish
values('BK-7','Canadian Bacon',0.2,4);

insert into event
values('99-001','1999-01-23','12:00 PM',12,'Boston Associates','Business Dinner','1290','02',400,3.5);
insert into event
values('99-002','1999-02-15','06:00 PM',18,'Worcester Lions Club','Wedding Reception','2120','03',275,4);
insert into event
values('99-003','1999-05-14','07:00 AM',7,'Westboro Lodge of Elks','Breakfast Meeting','1290','01',90,1);
insert into event
values('00-001','2000-09-18','06:00 AM',6,'Boston Elks','Breakfast Meeting','2501','06',100,2);
insert into event
values('01-001','2001-10-20','05:00 PM',17,'Framingham MEMA','Dinner','3212','02',400,5);
insert into event
values('01-002','2001-12-24','06:00 PM',18,'Westboro Lodge','Christmas Party','5463','10',1000,4);
insert into event
values('04-001','2004-12-10','05:00 PM',17,'Odd Fellows Hall','Dinner Meeting','5420','01',100,3);
insert into event
values('05-001','2005-01-18','07:00 PM',19,'Sportsman Club','Birthday Party','0125','03',125,4);

insert into event_staff
values('99-001','013-23-2121');
insert into event_staff
values('99-001','014-21-2331');
insert into event_staff
values('99-001','015-22-1212');
insert into event_staff
values('99-001','374-32-2121');
insert into event_staff
values('99-001','982-12-1212');
insert into event_staff
values('99-002','013-23-2121');
insert into event_staff
values('99-002','014-21-2331');
insert into event_staff
values('99-002','015-22-1212');
insert into event_staff
values('99-003','013-23-2121');
insert into event_staff
values('99-003','015-22-1212');
insert into event_staff
values('99-003','374-32-2121');
insert into event_staff
values('00-001','013-23-2121');
insert into event_staff
values('00-001','014-54-4412');
insert into event_staff
values('00-001','986-21-2721');
insert into event_staff
values('01-001','013-23-2121');
insert into event_staff
values('01-001','014-54-4412');
insert into event_staff
values('01-001','982-12-1212');
insert into event_staff
values('01-002','013-23-2121');
insert into event_staff
values('01-002','014-54-4412');
insert into event_staff
values('01-002','015-22-1212');
insert into event_staff
values('01-002','022-21-2352');
insert into event_staff
values('01-002','374-32-2121');
insert into event_staff
values('04-001','013-23-2121');
insert into event_staff
values('04-001','374-32-2121');
insert into event_staff
values('04-001','986-21-2721');
insert into event_staff
values('05-001','014-54-4412');
insert into event_staff
values('05-001','982-12-1212');
insert into event_staff
values('05-001','986-21-2721');

insert into course_item
values('10','AC-1');
insert into course_item
values('10','CX-1');
insert into course_item
values('10','SA-2');
insert into course_item
values('10','VG-2');
insert into course_item
values('11','AC-4');
insert into course_item
values('11','CX-1');
insert into course_item
values('11','SA-2');
insert into course_item
values('11','VG-2');
insert into course_item
values('20','PA-1');
insert into course_item
values('20','SA-2');
insert into course_item
values('20','SP-1');
insert into course_item
values('30','AC-4');
insert into course_item
values('30','BF-3');
insert into course_item
values('30','SA-2');
insert into course_item
values('30','VG-3');
insert into course_item
values('21','PA-3');
insert into course_item
values('21','SA-2');
insert into course_item
values('40','BK-1');
insert into course_item
values('40','BK-4');
insert into course_item
values('40','BK-5');
insert into course_item
values('41','BK-2');
insert into course_item
values('41','BK-5');
insert into course_item
values('42','BK-3');
insert into course_item
values('42','BK-6');
insert into course_item
values('89','AP-1');
insert into course_item
values('89','AP-2');
insert into course_item
values('89','AP-5');
insert into course_item
values('89','AP-6');
insert into course_item
values('89','DK-1');

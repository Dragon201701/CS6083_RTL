INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (1234, 'Remma', 'Logan', 9172666661, 'rlogan@gmail.com', 'Passport', 10909);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (8989, 'James', 'Logan', 9271633910, 'jlogan@gmail.com', 'SSN', 909118228);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (4567, 'John', 'Jones', 8908765791, 'jjones@gmail.com', 'License', 1100211);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (8790, 'Mary', 'Garcia', 7098641161, 'mgarcia@gmail.com', 'Passport', 10889);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (4321, 'Susan', 'Miller', 9087654321, 'smiller@gmail.com', 'SSN', 109909111);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (8765, 'Barbara', 'Davis', 1213456781, 'bdavis@gmail.com', 'Passport', 12281);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (9087, 'Linda', 'Lopez', 9977654219, 'llopez@gmail.com', 'License', 1090911);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (1111, 'David', 'Wilson', 9090876191, 'dwilson@gmail.com', 'Passport', 18909);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (2222, 'Charles', 'Smith', 9011188221, 'csmith@gmail.com', 'SSN', 202999111);

INSERT INTO alsm_customer (custid, c_fname, c_lname, contact, c_email, id_type, id_num)
VALUES (2345, 'Daniel', 'Anderson', 1288118822, 'danderson@gmail.com', 'License', 8192711);


INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (1,50);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (2,100);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (3,150);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (4,10);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (5,60);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (6,50);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (7,50);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (8,150);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (9,10);

INSERT INTO alsm_studyroom (roomid, capacity)
VALUES (10,20);

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (100,'ALSM_Individual');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (200,'ALSM_Organisation');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (300,'ALSM_Organisation');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (400,'ALSM_Individual');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (500,'ALSM_Organisation');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (600,'ALSM_Individual');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (700,'ALSM_Organisation');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (800,'ALSM_Individual');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (900,'ALSM_Organisation');

INSERT INTO alsm_sponsor (sponid, spontype)
VALUES (1000,'ALSM_Individual');


INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (1,'Lit Fest','ALSM_Exhibition',DATE('2012-06-18 10:34:09'),DATE('2012-06-18 12:34:09'), 9087);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (2,'Book Fest','ALSM_Exhibition',TO_DATE('2013/07/18 11:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2013/07/18 02:34:09', 'yyyy/mm/dd hh24:mi:ss'), 1234);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (3,'Rhymes','ALSM_Exhibition',TO_DATE('2014/08/18 10:34:09','yyyy/mm/dd hh24:mi:ss'),TO_DATE('2014/08/18 04:34:09','yyyy/mm/dd hh24:mi:ss'), 1024);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (4,'Compose','ALSM_Seminar',TO_Date('2015/06/18 10:00:00', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2015/06/18 12:34:09', 'yyyy/mm/dd hh24:mi:ss'), 9087);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (5,'Life and Drama','ALSM_Seminar',TO_DATE('2016/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2016/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 9090);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (6,'Conrad Fest','ALSM_Exhibition',TO_DATE('2017/06/18 06:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2017/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 5643);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (7,'Toddler Fun','ALSM_Seminar', TO_DATE('2018/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2018/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 1024);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (8,'Past and Us','ALSM_Seminar', TO_DATE('2019/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2019/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 6578);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (9,'Sci-Fi','ALSM_Seminar', TO_DATE('2020/07/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/07/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 2048);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (10,'Harry Potter','ALSM_Exhibition',TO_DATE('20210618 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('20210618 10:34:09', 'yyyy/mm/dd hh24:mi:ss'), 1234);

INSERT INTO alsm_event (event_id, event_name, event_type, startdate, stopdate, topicid)
VALUES (11,'Poem Discussion','ALSM_Exhibition',TO_DATE('20110418 06:30:00 ', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('20110418 09:34:00', 'yyyy/mm/dd hh24:mi:ss'), 9087);

INSERT INTO alsm_individual (sponid, f_name, l_name)
VALUES (100,'Kyle','Cooper');

INSERT INTO alsm_individual (sponid, f_name, l_name)
VALUES (400,'Nathan','Ortiz');

INSERT INTO alsm_individual (sponid, f_name, l_name)
VALUES (600,'Sara','Peterson');

INSERT INTO alsm_individual (sponid, f_name, l_name)
VALUES (800,'Denise','Bailey');

INSERT INTO alsm_individual (sponid, f_name, l_name)
VALUES (1000,'Diana','Reed');

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (2,1100.00);

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (3,1234.00);

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (10,18271.00);

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (11,2230.00);

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (6,1123.00);

INSERT INTO alsm_exhibition (event_id, exb_expenses)
VALUES (1,1234.00);


INSERT INTO alsm_seminar (event_id)
VALUES (4);

INSERT INTO alsm_seminar (event_id)
VALUES (5);

INSERT INTO alsm_seminar (event_id)
VALUES (7);

INSERT INTO alsm_seminar (event_id)
VALUES (9);

INSERT INTO alsm_seminar (event_id)
VALUES (8);

INSERT INTO alsm_sem_sponsor(fundid, f_amount, sponid, event_id)
VALUES(11,1000,700,7);

INSERT INTO alsm_sem_sponsor(fundid, f_amount, sponid, event_id)
VALUES(22,2000,800,8);

INSERT INTO alsm_sem_sponsor(fundid, f_amount, sponid, event_id)
VALUES(33,3000,700,4);

INSERT INTO alsm_sem_sponsor(fundid, f_amount, sponid, event_id)
VALUES(44,4000,800,5);

INSERT INTO alsm_sem_sponsor(fundid, f_amount, sponid, event_id)
VALUES(55,5000,700,9);


INSERT INTO alsm_reservation(res_id, timeslot, custid, roomid)
VALUES(80,TO_DATE('2012/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),1234,1);

INSERT INTO alsm_reservation(res_id, timeslot, custid, roomid)
VALUES(81,TO_DATE('2013/07/18 11:34:09', 'yyyy/mm/dd hh24:mi:ss'),8989,2);

INSERT INTO alsm_reservation(res_id, timeslot, custid, roomid)
VALUES(82,TO_Date('2015/06/18 10:00:00', 'yyyy/mm/dd hh24:mi:ss'),4567,3);

INSERT INTO alsm_reservation(res_id, timeslot, custid, roomid)
VALUES(83,TO_DATE('2020/07/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),8790,4);

INSERT INTO alsm_reservation(res_id, timeslot, custid, roomid)
VALUES(84,TO_DATE('20210618 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),4321,5);

INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(111, 89876543,'Available');

INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(222,18292833,'Rented');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(333,12345678,'Available');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(444, 42536172,'Available');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(555, 42536172,'Rented');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(666,90118211,'Available');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(777,42536172,'Rented');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(888,18292833,'Available');


INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(999,77118821,'Rented');



INSERT INTO alsm_book_copy(copy_id, isbn, status)
VALUES(100,90182816,'Rented');



INSERT INTO alsm_rentals(bor_id, bor_date, exp_rdate, act_rdate, copy_id, custid)
VALUES(1,TO_DATE('2012/06/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/28 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/28 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),222,1111);

INSERT INTO alsm_rentals(bor_id, bor_date, exp_rdate, act_rdate, copy_id, custid)
VALUES(2,TO_DATE('2012/06/19 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/29 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/29 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),555,1234);

INSERT INTO alsm_rentals(bor_id, bor_date, exp_rdate, act_rdate, copy_id, custid)
VALUES(3,TO_DATE('2012/06/20 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/30 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/06/30 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),666,8989);

INSERT INTO alsm_rentals(bor_id, bor_date, exp_rdate, act_rdate, copy_id, custid)
VALUES(4,TO_DATE('2012/06/21 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/07/09 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),NULL,999,4567);

INSERT INTO alsm_rentals(bor_id, bor_date, exp_rdate, act_rdate, copy_id, custid)
VALUES(5,TO_DATE('2012/06/22 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),TO_DATE('2012/07/18 10:34:09', 'yyyy/mm/dd hh24:mi:ss'),NULL,888,4321);




INSERT INTO alsm_custregistration(regid, event_id, custid)
VALUES(100,2,1234);

INSERT INTO alsm_custregistration(regid, event_id, custid)
VALUES(100,3,8989);

INSERT INTO alsm_custregistration(regid, event_id, custid)
VALUES(100,10,4567);

INSERT INTO alsm_custregistration(regid, event_id, custid)
VALUES(100,11,8790);

INSERT INTO alsm_custregistration(regid, event_id, custid)
VALUES(100,6,2345);



INSERT INTO alsm_aut_invite(inv_id, autid, event_id)
VALUES (10,1920182711,4);

INSERT INTO alsm_aut_invite(inv_id, autid, event_id)
VALUES (20,8102981766,4);

INSERT INTO alsm_aut_invite(inv_id, autid, event_id)
VALUES (30,9299119922,5);

INSERT INTO alsm_aut_invite(inv_id, autid, event_id)
VALUES (40,5654235787,7);

INSERT INTO alsm_aut_invite(inv_id, autid, event_id)
VALUES (50,7019281722);



INSERT INTO alsm_organisation(sponid, name)
VALUES (200,'Target');

INSERT INTO alsm_organisation(sponid, name)
VALUES (300,'Wallmart');

INSERT INTO alsm_organisation(sponid, name)
VALUES (500,'Johnson Co.');

INSERT INTO alsm_organisation(sponid, name)
VALUES (700,'Indeed');

INSERT INTO alsm_organisation(sponid, name)
VALUES (900,'LinkedIn');


INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (1920182711, 'Joe', 'Milan', '12', 'Alpha', 'Miami', 'Florida', 12919, 'jmilan@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (8102981766, 'Chris', 'Davis', '902', '53rd', 'Mesa', 'Arizona', 90287, 'cdavis@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (2021981766, 'Jenny', 'Brown', '5B', 'Senator', 'Fresno', 'California', 80981, 'jbrown@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (9299119922, 'Sia', 'Miller', '554', '29th', 'Tucson', 'Arizona', 77189, 'smiller@ymail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (1016719287, 'Rob', 'Jones', '2B', 'Senator', 'Riverside', 'California', 78764, 'rjones@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (7019281722, 'Kim', 'Lopez', '12', '56th', 'Irvine', 'California', 44532, 'klopez@live.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (7844412345, 'Bella', 'Geller', '7', 'Beta', 'Pittsburgh', 'Pennsylvania', 70987, 'bgeller@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (5654235787, 'Kelly', 'Smith', 5, '67th', 'Orlando', 'Florida', 89765, 'ksmith@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (8877665512, 'Jim', 'Thomas', 77, 'Sesame', 'Seattle', 'Washington', 56543, 'jthomas@gmail.com');

INSERT INTO alsm_author (autid, a_fname, a_lname, house_no, street, city, state, zipcode, a_email)
VALUES (1234567654, 'Holly', 'Louis', '554', '72nd', 'Portland', 'Oregon', 44335, 'hlouis@gmail.com');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (6578, 'History');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (1024, 'Children');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (2048, 'Science');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (9087, 'Arts');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (5643, 'Travel');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (7866, 'Adventure');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (9090, 'Drama');

INSERT INTO alsm_topic (topicid, t_name)
VALUES (1234, 'Fiction');

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (89876543, 'Gone Girl', 1234);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (18292833, 'Lion King', 9087);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (77118821, 'Mockingjay', 9090);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (90182816, 'Kitchen', 1234);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (90880099, 'Pride and Prejudice', 9090);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (10293811, 'Dune', 5643);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (42536172, 'Matilda', 6578);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (10102211, 'Prairie', 2048);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (12345678, 'Life of Pi', 7866);

INSERT INTO alsm_book (isbn, bname, topicid)
VALUES (90118211, 'Nursery Rhymes', 1024);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (10, 9299119922, 90880099);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (20, 1234567654, 89876543);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (30, 2021981766, 18292833);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (40, 7844412345, 90118211);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (50, 1016719287, 12345678);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (60, 7019281722, 10102211);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (70, 7844412345, 42536172);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (80, 5654235787, 90182816);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (90, 8877665512, 90182816);

INSERT INTO alsm_aut_book (id, autid, isbn)
VALUES (100, 1234567654, 89876543);




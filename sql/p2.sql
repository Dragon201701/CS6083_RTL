CREATE TABLE `alsm_aut_book` (
  `id` bigint NOT NULL COMMENT 'Unique identification for each pair of one author and one book',
  `autid` bigint NOT NULL,
  `isbn` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alsm_aut_book_alsm_author_fk` (`autid`),
  KEY `alsm_aut_book_alsm_book_fk` (`isbn`),
  CONSTRAINT `alsm_aut_book_alsm_author_fk` FOREIGN KEY (`autid`) REFERENCES `alsm_author` (`autid`),
  CONSTRAINT `alsm_aut_book_alsm_book_fk` FOREIGN KEY (`isbn`) REFERENCES `alsm_book` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_aut_invite` (
  `inv_id` bigint NOT NULL COMMENT 'Unique Invitation Identification number',
  `autid` bigint DEFAULT NULL,
  `event_id` bigint DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `alsm_aut_invite_alsm_author_fk` (`autid`),
  KEY `alsm_aut_invite_alsm_seminar_fk` (`event_id`),
  CONSTRAINT `alsm_aut_invite_alsm_author_fk` FOREIGN KEY (`autid`) REFERENCES `alsm_author` (`autid`),
  CONSTRAINT `alsm_aut_invite_alsm_seminar_fk` FOREIGN KEY (`event_id`) REFERENCES `alsm_seminar` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_author` (
  `autid` bigint NOT NULL COMMENT 'Unique ID number for each each author',
  `a_fname` varchar(20) NOT NULL COMMENT 'Author''s First Name\n',
  `a_lname` varchar(20) NOT NULL COMMENT 'Author''s Last Name',
  `house_no` varchar(5) NOT NULL COMMENT 'Author''s Residential House Number',
  `street` varchar(20) NOT NULL COMMENT 'Author''s Street Address',
  `city` varchar(20) NOT NULL COMMENT 'Author''s city',
  `state` varchar(20) NOT NULL COMMENT 'Author''s living State name',
  `zipcode` int NOT NULL COMMENT 'Author''s residential zipcode',
  `aemail` varchar(30) NOT NULL COMMENT 'Author''s email ID',
  PRIMARY KEY (`autid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_book` (
  `isbn` bigint NOT NULL COMMENT 'Unique number given to each book',
  `bname` varchar(30) NOT NULL COMMENT 'The title name of the book',
  `topicid` bigint NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `alsm_book_alsm_topic_fk` (`topicid`),
  CONSTRAINT `alsm_book_alsm_topic_fk` FOREIGN KEY (`topicid`) REFERENCES `alsm_topic` (`topicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_book_copy` (
  `copy_id` bigint NOT NULL COMMENT 'Unique Identification number for each book copy',
  `isbn` bigint NOT NULL,
  `status` varchar(10) NOT NULL COMMENT 'Status of the copy. Either available or on rent.',
  PRIMARY KEY (`copy_id`),
  KEY `alsm_book_copy_alsm_book_fk` (`isbn`),
  CONSTRAINT `alsm_book_copy_alsm_book_fk` FOREIGN KEY (`isbn`) REFERENCES `alsm_book` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_customer` (
  `custid` int NOT NULL COMMENT 'Unique ID given to each customer',
  `c_fname` varchar(20) NOT NULL COMMENT 'Customer''s first name',
  `c_lname` varchar(20) NOT NULL COMMENT 'Customer''s Last Name',
  `contact` bigint NOT NULL COMMENT 'Customer''s phone number',
  `c_email` varchar(30) NOT NULL COMMENT 'Customer''s Email ID',
  `crole` varchar(20) NOT NULL COMMENT 'role of the user: admin, user, employee or author.',
  `id_type` varchar(10) NOT NULL COMMENT 'Type of Identification document. Passport or SSN or Driver License.',
  `id_num` bigint NOT NULL COMMENT 'Unique number given to each ID document',
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_custregistration` (
  `regid` bigint NOT NULL COMMENT 'Unique ID for every Registration',
  `event_id` bigint NOT NULL,
  `custid` int DEFAULT NULL,
  PRIMARY KEY (`regid`),
  KEY `alsm_custregistration_alsm_customer_fk` (`custid`),
  KEY `alsm_custregistration_alsm_exhibition_fk` (`event_id`),
  CONSTRAINT `alsm_custregistration_alsm_customer_fk` FOREIGN KEY (`custid`) REFERENCES `alsm_customer` (`custid`),
  CONSTRAINT `alsm_custregistration_alsm_exhibition_fk` FOREIGN KEY (`event_id`) REFERENCES `alsm_exhibition` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_event` (
  `event_id` bigint NOT NULL COMMENT 'Unique Identifiaction number to each event',
  `event_name` varchar(20) NOT NULL COMMENT 'Event''s Name',
  `event_type` varchar(15) NOT NULL COMMENT 'Event Type: Seminar or Exhibition',
  `startdate` datetime NOT NULL COMMENT 'The day and time event started',
  `stopdate` datetime NOT NULL COMMENT 'The day and time the event ended or is expected to end.',
  `topicid` bigint NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `alsm_event_alsm_topic_fk` (`topicid`),
  CONSTRAINT `alsm_event_alsm_topic_fk` FOREIGN KEY (`topicid`) REFERENCES `alsm_topic` (`topicid`),
  CONSTRAINT `ch_inh_alsm_event` CHECK ((`event_type` in (_utf8mb4'ALSM_Event',_utf8mb4'ALSM_Exhibition',_utf8mb4'ALSM_Seminar')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_exhibition` (
  `event_id` bigint NOT NULL COMMENT 'Unique Identifiaction number to each event',
  `exb_expenses` bigint NOT NULL COMMENT 'Expenses of the exhibition',
  PRIMARY KEY (`event_id`),
  CONSTRAINT `alsm_exhibition_alsm_event_fk` FOREIGN KEY (`event_id`) REFERENCES `alsm_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_individual` (
  `sponid` bigint NOT NULL COMMENT 'Unique ID number given to each sponsor',
  `f_name` varchar(20) NOT NULL COMMENT 'Individual sponsor''s First Name	',
  `l_name` varchar(20) NOT NULL COMMENT 'Individual Sponsor''s Last Name',
  PRIMARY KEY (`sponid`),
  CONSTRAINT `alsm_individual_alsm_sponsor_fk` FOREIGN KEY (`sponid`) REFERENCES `alsm_sponsor` (`sponid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_invoice` (
  `inv_id` bigint NOT NULL COMMENT 'Unique identification number for each invoice',
  `inv_date` datetime DEFAULT NULL COMMENT 'The date invoice was generated',
  `inv_amnt` decimal(8,2) DEFAULT NULL COMMENT 'The total amount customer pays to the library',
  `bor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `alsm_invoice_alsm_rentals_fk` (`bor_id`),
  CONSTRAINT `alsm_invoice_alsm_rentals_fk` FOREIGN KEY (`bor_id`) REFERENCES `alsm_rentals` (`bor_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_organisation` (
  `sponid` bigint NOT NULL COMMENT 'Unique ID number given to each sponsor',
  `name` varchar(20) NOT NULL COMMENT 'Organisation''s full name',
  PRIMARY KEY (`sponid`),
  CONSTRAINT `alsm_organisation_alsm_sponsor_fk` FOREIGN KEY (`sponid`) REFERENCES `alsm_sponsor` (`sponid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_payment` (
  `pid` int NOT NULL COMMENT 'Unique Payment ID',
  `pdate` datetime NOT NULL COMMENT 'The date od payment made',
  `pmethod` varchar(20) NOT NULL COMMENT 'Cash, Debit or Credit Card, or Paypal ',
  `pamount` bigint NOT NULL COMMENT 'Amount paid by the method of payment',
  `cardname` varchar(20) DEFAULT NULL COMMENT 'Name of the card holder if payment done by card',
  `inv_id` bigint NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `alsm_payment_alsm_invoice_fk` (`inv_id`),
  CONSTRAINT `alsm_payment_alsm_invoice_fk` FOREIGN KEY (`inv_id`) REFERENCES `alsm_invoice` (`inv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_rentals` (
  `bor_id` bigint NOT NULL COMMENT 'Unique ID to each borrow activity',
  `bor_date` datetime NOT NULL COMMENT 'The date a copy of book was borrowed',
  `exp_rdate` datetime NOT NULL COMMENT 'The date a copy of book is expected to be returned',
  `act_rdate` datetime DEFAULT NULL COMMENT 'The date a copy of book was actually returned',
  `copy_id` bigint DEFAULT NULL,
  `custid` int DEFAULT NULL,
  `r_status` varchar(15) NOT NULL COMMENT 'Rental status: borrowed, returned or late',
  PRIMARY KEY (`bor_id`),
  KEY `alsm_rentals_alsm_book_copy_fk` (`copy_id`),
  KEY `alsm_rentals_alsm_customer_fk` (`custid`),
  CONSTRAINT `alsm_rentals_alsm_book_copy_fk` FOREIGN KEY (`copy_id`) REFERENCES `alsm_book_copy` (`copy_id`),
  CONSTRAINT `alsm_rentals_alsm_customer_fk` FOREIGN KEY (`custid`) REFERENCES `alsm_customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_reservation` (
  `res_id` bigint NOT NULL COMMENT 'Unique identification number for each reservation',
  `timeslot` datetime NOT NULL COMMENT 'Date and Time of the reservation',
  `custid` int DEFAULT NULL,
  `roomid` bigint NOT NULL,
  PRIMARY KEY (`res_id`),
  KEY `alsm_reservation_alsm_customer_fk` (`custid`),
  KEY `alsm_reservation_alsm_studyroom_fk` (`roomid`),
  CONSTRAINT `alsm_reservation_alsm_customer_fk` FOREIGN KEY (`custid`) REFERENCES `alsm_customer` (`custid`),
  CONSTRAINT `alsm_reservation_alsm_studyroom_fk` FOREIGN KEY (`roomid`) REFERENCES `alsm_studyroom` (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_sem_sponsor` (
  `fundid` bigint NOT NULL COMMENT 'Unique ID rto identify all individual funding details',
  `f_amount` decimal(8,2) NOT NULL COMMENT 'Each sponsor''s funding to each event',
  `sponid` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  PRIMARY KEY (`fundid`),
  KEY `alsm_sem_sponsor_alsm_seminar_fk` (`event_id`),
  KEY `alsm_sem_sponsor_alsm_sponsor_fk` (`sponid`),
  CONSTRAINT `alsm_sem_sponsor_alsm_seminar_fk` FOREIGN KEY (`event_id`) REFERENCES `alsm_seminar` (`event_id`),
  CONSTRAINT `alsm_sem_sponsor_alsm_sponsor_fk` FOREIGN KEY (`sponid`) REFERENCES `alsm_sponsor` (`sponid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_seminar` (
  `event_id` bigint NOT NULL COMMENT 'Unique Identifiaction number to each event',
  PRIMARY KEY (`event_id`),
  CONSTRAINT `alsm_seminar_alsm_event_fk` FOREIGN KEY (`event_id`) REFERENCES `alsm_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_sponsor` (
  `sponid` bigint NOT NULL COMMENT 'Unique ID number given to each sponsor',
  `spontype` varchar(17) NOT NULL COMMENT 'Type of sponsor: organisation or individual',
  PRIMARY KEY (`sponid`),
  CONSTRAINT `ch_inh_alsm_sponsor` CHECK ((`spontype` in (_utf8mb4'ALSM_Individual',_utf8mb4'ALSM_Organisation',_utf8mb4'ALSM_Sponsor')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_studyroom` (
  `roomid` bigint NOT NULL COMMENT 'Unique room id number ',
  `capacity` smallint NOT NULL COMMENT 'Maximum capacity of the room',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `alsm_topic` (
  `topicid` bigint NOT NULL COMMENT 'Unique number to identify topics',
  `t_name` varchar(20) NOT NULL COMMENT 'Topic name',
  PRIMARY KEY (`topicid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#insertion
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (10,9299119922,90880099);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (	20,	1234567654,	89876543);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (	30, 2021981766,	18292833);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (	40,	7844412345,	90118211);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (	50, 1016719287, 12345678);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (	60, 7019281722,	10102211);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (80, 5654235787, 90182816);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (90, 8877665512, 90182816);
INSERT INTO `test`.`alsm_aut_book` (`id`,`autid`,`isbn`) VALUES (100, 1234567654, 89876543);


INSERT INTO `test`.`alsm_aut_invite`(`inv_id`,`autid`,`event_id`) VALUES (10, 1920182711, 4);
INSERT INTO `test`.`alsm_aut_invite`(`inv_id`,`autid`,`event_id`) VALUES (20, 8102981766, 4);
INSERT INTO `test`.`alsm_aut_invite`(`inv_id`,`autid`,`event_id`) VALUES (30, 9299119922, 5);
INSERT INTO `test`.`alsm_aut_invite`(`inv_id`,`autid`,`event_id`) VALUES (40, 5654235787, 7);
INSERT INTO `test`.`alsm_aut_invite`(`inv_id`,`autid`,`event_id`) VALUES (50, 7019281722, 8);

INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES
 (1016719287, 'Rob', 'Jones', '2B', 'Senator', 'Riverside', 'California', 78764, 'rjones@gmail.com');
 
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
 (1234567654, 'Holly', 'Louis', '554', '72nd', 'Portland', 'Oregon', 44335, 'hlouis@gmail.com');
 
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(1920182711, 'Joe', 'Milan', '12', 'Alpha', 'Miami', 'Florida', 12919, 'jmilan@gmail.com');
  
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(2021981766, 'Jenny', 'Brown', '5B', 'Senator', 'Fresno', 'California', 80981, 'jbrown@gmail.com');
   
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(5654235787, 'Kelly', 'Smith', '5', '67th', 'Orlando', 'Florida', 89765, 'ksmith@gmail.com');
    
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(7019281722, 'Kim', 'Lopez', '12', '56th', 'Irvine', 'California', 44532, 'klopez@live.com');
     
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(7844412345, 'Bella', 'Geller', '7', 'Beta', 'Pittsburgh', 'Pennsylvania', 70987, 'bgeller@gmail.com');
      
INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(8102981766, 'Chris', 'Davis', '902', '53rd', 'Mesa', 'Arizona', 90287, 'cdavis@gmail.com');

INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(8877665512, 'Jim', 'Thomas', '77', 'Sesame', 'Seattle', 'Washington', 56543, 'jthomas@gmail.com');

INSERT INTO `test`.`alsm_author` (`autid`, `a_fname`, `a_lname`, `house_no`, `street`, `city`, `state`, `zipcode`, `aemail`) VALUES 
(9299119922, 'Sia', 'Miller', '554', '29th', 'Tucson', 'Arizona', 77189, 'smiller@ymail.com');

#check constraints
alter table ALSM_Author
add constraint chk_author_email
check (aemail LIKE '%_@__%.__%');

alter table ALSM_Book_Copy
add constraint chk_copy_status
check (status = 0 or status = 1);

alter table alsm_event
add constraint chk_event_enddate
check (stopdate >= startdate);

alter table ALSM_Sem_Sponsor
add constraint chk_seminar_sponsor_fund
check (F_Amount >= 0);

alter table alsm_customer
add constraint chk_customer_idtype 
check (id_type = 'passport' or id_type = 'driver license' or id_type = 'ssn');

alter table alsm_customer
add constraint chk_customer_email
check (c_email LIKE '%_@__%.__%');

alter table alsm_customer
add constraint chk_customer_phone
check (CHAR_LENGTH(contact) = 10);

alter table ALSM_Invoice 
add constraint chk_invoice_amount 
check (inv_amnt >= 0);

alter table ALSM_Invoice 
add constraint chk_invoice_pay_method
check (pmethod = 'Credit' or pmethod = 'Debit' or pmethod = 'Paypal' or pmethod = 'Cash');

alter table ALSM_studyroom
add constraint chk_stuyroom_cap
check (capacity > 0 AND capacity < 100);

alter table alsm_rentals
add constraint chk_rental_status
check (status = 0 or status = 1 or status = 2);

alter table alsm_rentals
add constraint chk_rental_erdate
check (exp_rdate > bor_date);




INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(10102211, 'Prairie', 2048);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(10293811, 'Dune', 5643);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(12345678, 'Life of Pi', 7866);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(18292833, 'Lion King', 9087);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(42536172, 'Matilda', 6578);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(77118821, 'Mockingjay', 9090);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(89876543, 'Gone Girl', 1234);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(90118211, 'Nursery Rhymes', 1024);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(90182816, 'Kitchen', 1234);
INSERT INTO `test`.`alsm_book`(`isbn`,`bname`,`topicid`) VALUES(90880099, 'Pride and Prejudice', 9090);



INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(100, 90182816, 'Rented');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(111, 89876543, 'Available');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(222,18292833, 'Rented');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(333, 12345678, 'Available');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(444, 42536172, 'Available');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(555, 42536172, 'Rented');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(666, 90118211, 'Available');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(777, 42536172, 'Rented');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(888, 18292833, 'Available');
INSERT INTO `test`.`alsm_book_copy`(`copy_id`,`isbn`,`status`) VALUES(999, 77118821, 'Rented');

INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('1024', 'Children');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('1234', 'Fiction');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('2048', 'Science');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('5643', 'Travel');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('6578', 'History');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('7866', 'Adventure');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('9087', 'Arts');
INSERT INTO `alsm_topic`(`topicid`,`t_name`) VALUES('9090', 'Drama');

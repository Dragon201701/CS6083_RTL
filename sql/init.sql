-- SQLINES DEMO *** le SQL Developer Data Modeler 20.4.0.374.0801
-- SQLINES DEMO *** -04-29 22:13:02 EDT
-- SQLINES DEMO *** le Database 21c
-- SQLINES DEMO *** le Database 21c



-- SQLINES DEMO *** no DDL - MDSYS.SDO_GEOMETRY

-- SQLINES DEMO *** no DDL - XMLTYPE

CREATE TABLE alsm_aut_book (
    id     BIGINT NOT NULL COMMENT 'Unique identification for each pair of one author and one book',
    autid  BIGINT NOT NULL,
    isbn   BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_aut_book.id IS
    'Unique identification for each pair of one author and one book'; */

ALTER TABLE alsm_aut_book ADD CONSTRAINT alsm_aut_book_pk PRIMARY KEY ( id );

CREATE TABLE alsm_aut_invite (
    invid     BIGINT NOT NULL COMMENT 'Unique Invitation Identification number',
    autid     BIGINT,
    event_id  BIGINT
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_aut_invite.invid IS
    'Unique Invitation Identification number'; */

ALTER TABLE alsm_aut_invite ADD CONSTRAINT alsm_aut_invite_pk PRIMARY KEY ( invid );

CREATE TABLE alsm_author (
    autid    BIGINT NOT NULL COMMENT 'Unique ID number for each each author',
    afname   VARCHAR(20) NOT NULL COMMENT 'Author''s First Name
',
    alname   VARCHAR(20) NOT NULL COMMENT 'Author''s Last Name',
    house    VARCHAR(5) NOT NULL COMMENT 'Author''s Residential House Number',
    street   VARCHAR(20) NOT NULL COMMENT 'Author''s Street Address',
    city     VARCHAR(20) NOT NULL COMMENT 'Author''s city',
    state    VARCHAR(20) NOT NULL COMMENT 'Author''s living State name',
    zipcode  INT NOT NULL COMMENT 'Author''s residential zipcode',
    aemail   VARCHAR(30) NOT NULL COMMENT 'Author''s email ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.autid IS
    'Unique ID number for each each author'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.afname IS
    'Author''s First Name
'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.alname IS
    'Author''s Last Name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.house IS
    'Author''s Residential House Number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.street IS
    'Author''s Street Address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.city IS
    'Author''s city'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.state IS
    'Author''s living State name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.zipcode IS
    'Author''s residential zipcode'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_author.aemail IS
    'Author''s email ID'; */

ALTER TABLE alsm_author ADD CONSTRAINT alsm_author_pk PRIMARY KEY ( autid );

CREATE TABLE alsm_book (
    isbn     BIGINT NOT NULL COMMENT 'Unique number given to each book',
    bname    VARCHAR(30) NOT NULL COMMENT 'The title name of the book',
    topicid  BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_book.isbn IS
    'Unique number given to each book'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_book.bname IS
    'The title name of the book'; */

ALTER TABLE alsm_book ADD CONSTRAINT alsm_book_pk PRIMARY KEY ( isbn );

CREATE TABLE alsm_book_copy (
    copyid  BIGINT NOT NULL COMMENT 'Unique Identification number for each book copy',
    isbn    BIGINT NOT NULL,
    status  VARCHAR(10) NOT NULL COMMENT 'Status of the copy. Either available or on rent.'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_book_copy.copyid IS
    'Unique Identification number for each book copy'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_book_copy.status IS
    'Status of the copy. Either available or on rent.'; */

ALTER TABLE alsm_book_copy ADD CONSTRAINT alsm_book_copy_pk PRIMARY KEY ( copyid );

CREATE TABLE alsm_customer (
    cid       INT NOT NULL COMMENT 'Unique ID given to each customer',
    cfname    VARCHAR(20) NOT NULL COMMENT 'Customer''s first name',
    clname    VARCHAR(20) NOT NULL COMMENT 'Customer''s Last Name',
    contact   BIGINT NOT NULL COMMENT 'Customer''s phone number',
    cemail    VARCHAR(30) NOT NULL COMMENT 'Customer''s Email ID',
    cid_type  VARCHAR(10) NOT NULL COMMENT 'Type of Identification document. Passport or SSN or Driver License.',
    cid_num   VARCHAR(20) NOT NULL COMMENT 'Unique number given to each ID document'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.cid IS
    'Unique ID given to each customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.cfname IS
    'Customer''s first name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.clname IS
    'Customer''s Last Name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.contact IS
    'Customer''s phone number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.cemail IS
    'Customer''s Email ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.cid_type IS
    'Type of Identification document. Passport or SSN or Driver License.'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_customer.cid_num IS
    'Unique number given to each ID document'; */

ALTER TABLE alsm_customer ADD CONSTRAINT alsm_customer_pk PRIMARY KEY ( cid );

CREATE TABLE alsm_custregistration (
    regid     BIGINT NOT NULL,
    event_id  BIGINT NOT NULL,
    custid    INT
);

ALTER TABLE alsm_custregistration ADD CONSTRAINT alsm_custregistration_pk PRIMARY KEY ( regid );

CREATE TABLE alsm_event (
    eid        BIGINT NOT NULL COMMENT 'Unique Identifiaction number to each event',
    ename      VARCHAR(20) NOT NULL COMMENT 'Event''s Name',
    etype      VARCHAR(15) NOT NULL COMMENT 'Event Type: Seminar or Exhibition',
    startdate  DATETIME NOT NULL COMMENT 'The day and time event started',
    stopdate   DATETIME NOT NULL COMMENT 'The day and time the event ended or is expected to end.',
    topicid    BIGINT NOT NULL
);

ALTER TABLE alsm_event
    ADD CONSTRAINT ch_inh_alsm_event CHECK ( etype IN ( 'ALSM_Event', 'ALSM_Exhibition', 'ALSM_Seminar' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_event.eid IS
    'Unique Identifiaction number to each event'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_event.ename IS
    'Event''s Name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_event.etype IS
    'Event Type: Seminar or Exhibition'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_event.startdate IS
    'The day and time event started'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_event.stopdate IS
    'The day and time the event ended or is expected to end.'; */

ALTER TABLE alsm_event ADD CONSTRAINT alsm_event_pk PRIMARY KEY ( eid );

CREATE TABLE alsm_exhibition (
    eventid       BIGINT NOT NULL COMMENT 'Unique Identifiaction number to each event',
    exp_expenses  BIGINT NOT NULL COMMENT 'Expenses of the exhibition'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_exhibition.eventid IS
    'Unique Identifiaction number to each event'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_exhibition.exp_expenses IS
    'Expenses of the exhibition'; */

ALTER TABLE alsm_exhibition ADD CONSTRAINT alsm_exhibition_pk PRIMARY KEY ( eventid );

CREATE TABLE alsm_individual (
    sponid  BIGINT NOT NULL COMMENT 'Unique ID number given to each sponsor',
    sfname  VARCHAR(20) NOT NULL COMMENT 'Individual sponsor''s First Name	',
    slname  VARCHAR(20) NOT NULL COMMENT 'Individual Sponsor''s Last Name'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_individual.sponid IS
    'Unique ID number given to each sponsor'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_individual.sfname IS
    'Individual sponsor''s First Name	'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_individual.slname IS
    'Individual Sponsor''s Last Name'; */

ALTER TABLE alsm_individual ADD CONSTRAINT alsm_individual_pk PRIMARY KEY ( sponid );

CREATE TABLE alsm_invoice (
    invid    BIGINT NOT NULL COMMENT 'Unique identification number for each invoice',
    invdate  DATETIME NOT NULL COMMENT 'The date invoice was generated',
    iamount  DECIMAL(8, 2) NOT NULL COMMENT 'The total amount customer pays to the library',
    pmethod  VARCHAR(10) COMMENT 'Method of payment used by customer'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_invoice.invid IS
    'Unique identification number for each invoice'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_invoice.invdate IS
    'The date invoice was generated'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_invoice.iamount IS
    'The total amount customer pays to the library'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_invoice.pmethod IS
    'Method of payment used by customer'; */

ALTER TABLE alsm_invoice ADD CONSTRAINT alsm_invoice_pk PRIMARY KEY ( invid );

CREATE TABLE alsm_organisation (
    sponid  BIGINT NOT NULL COMMENT 'Unique ID number given to each sponsor',
    name    VARCHAR(20) NOT NULL COMMENT 'Organisation''s full name'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_organisation.sponid IS
    'Unique ID number given to each sponsor'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_organisation.name IS
    'Organisation''s full name'; */

ALTER TABLE alsm_organisation ADD CONSTRAINT alsm_organisation_pk PRIMARY KEY ( sponid );

CREATE TABLE alsm_payment (
    pid      BIGINT NOT NULL COMMENT 'Payment ID',
    pdate    DATETIME NOT NULL COMMENT 'Payment Date',
    pmethod  TINYINT NOT NULL COMMENT 'Payment Method 1 - cash 2 - credit  card 3 - debit card 4 - paypal',
    pamount  DECIMAL(8, 2) NOT NULL COMMENT 'Payment amount in USD',
    invid1   BIGINT
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_payment.pid IS
    'Payment ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_payment.pdate IS
    'Payment Date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_payment.pmethod IS
    'Payment Method 1 - cash 2 - credit  card 3 - debit card 4 - paypal'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_payment.pamount IS
    'Payment amount in USD'; */

ALTER TABLE alsm_payment ADD CONSTRAINT alsm_payment_pk PRIMARY KEY ( pid );

CREATE TABLE alsm_rentals (
    borid     BIGINT NOT NULL COMMENT 'Unique ID to each borrow activity',
    bdate     DATETIME NOT NULL COMMENT 'The date a copy of book was borrowed',
    exprdate  DATETIME NOT NULL COMMENT 'The date a copy of book is expected to be returned',
    actrdate  DATETIME COMMENT 'The date a copy of book was actually returned',
    copyid    BIGINT,
    custid    INT,
    status    TINYINT NOT NULL COMMENT '0 - Borrowed
1 - Returned
2 - late',
    status1   TINYINT NOT NULL COMMENT '0 - Borrowed
1 - returned
2 - late',
    invid     BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.borid IS
    'Unique ID to each borrow activity'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.bdate IS
    'The date a copy of book was borrowed'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.exprdate IS
    'The date a copy of book is expected to be returned'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.actrdate IS
    'The date a copy of book was actually returned'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.status IS
    '0 - Borrowed
1 - Returned
2 - late'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_rentals.status1 IS
    '0 - Borrowed
1 - returned
2 - late'; */

CREATE UNIQUE INDEX alsm_rentals__idx ON
    alsm_rentals (
        invid
    ASC );

ALTER TABLE alsm_rentals ADD CONSTRAINT alsm_rentals_pk PRIMARY KEY ( borid );

CREATE TABLE alsm_reservation (
    resid     BIGINT NOT NULL COMMENT 'Unique identification number for each reservation',
    timeslot  DATETIME NOT NULL COMMENT 'Date and Time of the reservation',
    custid    INT,
    roomid    BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_reservation.resid IS
    'Unique identification number for each reservation'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_reservation.timeslot IS
    'Date and Time of the reservation'; */

ALTER TABLE alsm_reservation ADD CONSTRAINT alsm_reservation_pk PRIMARY KEY ( resid );

CREATE TABLE alsm_sem_sponsor (
    fundid   BIGINT NOT NULL COMMENT 'Unique ID rto identify all individual funding details',
    famount  DECIMAL(8, 2) NOT NULL COMMENT 'Each sponsor''s funding to each event',
    sponid   BIGINT NOT NULL,
    eventid  BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_sem_sponsor.fundid IS
    'Unique ID rto identify all individual funding details'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_sem_sponsor.famount IS
    'Each sponsor''s funding to each event'; */

ALTER TABLE alsm_sem_sponsor ADD CONSTRAINT alsm_sem_sponsor_pk PRIMARY KEY ( fundid );

CREATE TABLE alsm_seminar (
    eventid BIGINT NOT NULL COMMENT 'Unique Identifiaction number to each event'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_seminar.eventid IS
    'Unique Identifiaction number to each event'; */

ALTER TABLE alsm_seminar ADD CONSTRAINT alsm_seminar_pk PRIMARY KEY ( eventid );

CREATE TABLE alsm_sponsor (
    sponid    BIGINT NOT NULL COMMENT 'Unique ID number given to each sponsor',
    spontype  VARCHAR(17) NOT NULL COMMENT 'Type of sponsor: organisation or individual'
);

ALTER TABLE alsm_sponsor
    ADD CONSTRAINT ch_inh_alsm_sponsor CHECK ( spontype IN ( 'ALSM_Individual', 'ALSM_Organisation', 'ALSM_Sponsor' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_sponsor.sponid IS
    'Unique ID number given to each sponsor'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_sponsor.spontype IS
    'Type of sponsor: organisation or individual'; */

ALTER TABLE alsm_sponsor ADD CONSTRAINT alsm_sponsor_pk PRIMARY KEY ( sponid );

CREATE TABLE alsm_studyroom (
    roomid    BIGINT NOT NULL COMMENT 'Unique room id number ',
    capacity  SMALLINT NOT NULL COMMENT 'Maximum capacity of the room'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_studyroom.roomid IS
    'Unique room id number '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_studyroom.capacity IS
    'Maximum capacity of the room'; */

ALTER TABLE alsm_studyroom ADD CONSTRAINT alsm_studyroom_pk PRIMARY KEY ( roomid );

CREATE TABLE alsm_topic (
    topicid  BIGINT NOT NULL COMMENT 'Unique number to identify topics',
    tname    VARCHAR(20) NOT NULL COMMENT 'Topic name'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_topic.topicid IS
    'Unique number to identify topics'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN alsm_topic.tname IS
    'Topic name'; */

ALTER TABLE alsm_topic ADD CONSTRAINT alsm_topic_pk PRIMARY KEY ( topicid );

ALTER TABLE alsm_aut_book
    ADD CONSTRAINT alsm_aut_book_alsm_author_fk FOREIGN KEY ( autid )
        REFERENCES alsm_author ( autid );

ALTER TABLE alsm_aut_book
    ADD CONSTRAINT alsm_aut_book_alsm_book_fk FOREIGN KEY ( isbn )
        REFERENCES alsm_book ( isbn );

ALTER TABLE alsm_aut_invite
    ADD CONSTRAINT alsm_aut_invite_alsm_author_fk FOREIGN KEY ( autid )
        REFERENCES alsm_author ( autid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_aut_invite
    ADD CONSTRAINT alsm_aut_invite_alsm_seminar_fk FOREIGN KEY ( event_id )
        REFERENCES alsm_seminar ( eventid );

ALTER TABLE alsm_book
    ADD CONSTRAINT alsm_book_alsm_topic_fk FOREIGN KEY ( topicid )
        REFERENCES alsm_topic ( topicid );

ALTER TABLE alsm_book_copy
    ADD CONSTRAINT alsm_book_copy_alsm_book_fk FOREIGN KEY ( isbn )
        REFERENCES alsm_book ( isbn );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_custregistration
    ADD CONSTRAINT alsm_custregistration_alsm_customer_fk FOREIGN KEY ( custid )
        REFERENCES alsm_customer ( cid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_custregistration
    ADD CONSTRAINT alsm_custregistration_alsm_exhibition_fk FOREIGN KEY ( event_id )
        REFERENCES alsm_exhibition ( eventid );

ALTER TABLE alsm_event
    ADD CONSTRAINT alsm_event_alsm_topic_fk FOREIGN KEY ( topicid )
        REFERENCES alsm_topic ( topicid );

ALTER TABLE alsm_exhibition
    ADD CONSTRAINT alsm_exhibition_event_fk FOREIGN KEY ( eventid )
        REFERENCES alsm_event ( eid );

ALTER TABLE alsm_individual
    ADD CONSTRAINT alsm_individual_sponsor_fk FOREIGN KEY ( sponid )
        REFERENCES alsm_sponsor ( sponid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_organisation
    ADD CONSTRAINT alsm_organisation_alsm_sponsor_fk FOREIGN KEY ( sponid )
        REFERENCES alsm_sponsor ( sponid );

ALTER TABLE alsm_payment
    ADD CONSTRAINT alsm_payment_alsm_invoice_fk FOREIGN KEY ( invid1 )
        REFERENCES alsm_invoice ( invid );

ALTER TABLE alsm_rentals
    ADD CONSTRAINT alsm_rentals_alsm_book_copy_fk FOREIGN KEY ( copyid )
        REFERENCES alsm_book_copy ( copyid );

ALTER TABLE alsm_rentals
    ADD CONSTRAINT alsm_rentals_alsm_customer_fk FOREIGN KEY ( custid )
        REFERENCES alsm_customer ( cid );

ALTER TABLE alsm_rentals
    ADD CONSTRAINT alsm_rentals_alsm_invoice_fk FOREIGN KEY ( invid )
        REFERENCES alsm_invoice ( invid )
            ON DELETE CASCADE;

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_reservation
    ADD CONSTRAINT alsm_reservation_alsm_customer_fk FOREIGN KEY ( custid )
        REFERENCES alsm_customer ( cid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_reservation
    ADD CONSTRAINT alsm_reservation_alsm_studyroom_fk FOREIGN KEY ( roomid )
        REFERENCES alsm_studyroom ( roomid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_sem_sponsor
    ADD CONSTRAINT alsm_sem_sponsor_alsm_seminar_fk FOREIGN KEY ( eventid )
        REFERENCES alsm_seminar ( eventid );

-- SQLINES DEMO *** ength exceeds maximum allowed length(30) 
ALTER TABLE alsm_sem_sponsor
    ADD CONSTRAINT alsm_sem_sponsor_alsm_sponsor_fk FOREIGN KEY ( sponid )
        REFERENCES alsm_sponsor ( sponid );

ALTER TABLE alsm_seminar
    ADD CONSTRAINT alsm_seminar_event_fk FOREIGN KEY ( eventid )
        REFERENCES alsm_event ( eid );

CREATE OR REPLACE TRIGGER arc_fkarc_7_alsm_seminar BEFORE
    INSERT OR UPDATE OF eventid ON alsm_seminar
    FOR EACH ROW
    DECLARE d VARCHAR(15);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.etype
    INTO d
    FROM
        alsm_event a
    WHERE
        a.eid = :new.eventid;

    IF ( d IS NULL OR d <> 'ALSM_Seminar' ) THEN
        raise_application_error(-20223,
                               'FK ALSM_Seminar_Event_FK in Table ALSM_Seminar violates Arc constraint on Table ALSM_Event - discriminator column EType doesn''t have value ''ALSM_Seminar''');
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_7_alsm_exhibition BEFORE
    INSERT OR UPDATE OF eventid ON alsm_exhibition
    FOR EACH ROW
    DECLARE d VARCHAR(15);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.etype
    INTO d
    FROM
        alsm_event a
    WHERE
        a.eid = :new.eventid;

    IF ( d IS NULL OR d <> 'ALSM_Exhibition' ) THEN
        raise_application_error(-20223,
                               'FK ALSM_Exhibition_Event_FK in Table ALSM_Exhibition violates Arc constraint on Table ALSM_Event - discriminator column EType doesn''t have value ''ALSM_Exhibition''');
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_8_alsm_organisation BEFORE
    INSERT OR UPDATE OF sponid ON alsm_organisation
    FOR EACH ROW
    DECLARE d VARCHAR(17);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.spontype
    INTO d
    FROM
        alsm_sponsor a
    WHERE
        a.sponid = :new.sponid;

    IF ( d IS NULL OR d <> 'ALSM_Organisation' ) THEN
        raise_application_error(-20223,
                               'FK ALSM_Organisation_ALSM_Sponsor_FK in Table ALSM_Organisation violates Arc constraint on Table ALSM_Sponsor - discriminator column SponType doesn''t have value ''ALSM_Organisation''');
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_8_alsm_individual BEFORE
    INSERT OR UPDATE OF sponid ON alsm_individual
    FOR EACH ROW
    DECLARE d VARCHAR(17);
BEGIN
    -- SQLINES LICENSE FOR EVALUATION USE ONLY
    SELECT
        a.spontype
    INTO d
    FROM
        alsm_sponsor a
    WHERE
        a.sponid = :new.sponid;

    IF ( d IS NULL OR d <> 'ALSM_Individual' ) THEN
        raise_application_error(-20223,
                               'FK ALSM_Individual_Sponsor_FK in Table ALSM_Individual violates Arc constraint on Table ALSM_Sponsor - discriminator column SponType doesn''t have value ''ALSM_Individual''');
    END IF;

    DECLARE EXIT HANDLER FOR not found BEGIN
        NULL;
    END;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
        RESIGNAL;
    END;
END;
/



-- SQLINES DEMO *** per Data Modeler Summary Report: 
-- 
-- SQLINES DEMO ***                        20
-- SQLINES DEMO ***                         1
-- SQLINES DEMO ***                        43
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** DY                      0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         4
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE BODY              0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** EGMENT                  0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** ED VIEW                 0
-- SQLINES DEMO *** ED VIEW LOG             0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** A                       0
-- SQLINES DEMO *** T                       0
-- 
-- SQLINES DEMO ***                         8
-- SQLINES DEMO ***                         0

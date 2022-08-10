
-- create multiple tables 6 total: CUSTOMER, TICKET, FOOD, LOCATION, MOVIE, THEATER, SEAT

--CUSTOMER
CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY, 
	first_name varchar(20),
	last_name varchar(20),
	email varchar(30),
	loyalty_member boolean
);

SELECT *
FROM customer;


--TICKET - LEAVE FOREIGN KEYS FOR LATER only the customer_id input, THEY WONT WORK IF I TRY TO DO THEM RIGHT NOW...
CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY, 
	description varchar(100),
	customer_id integer NOT NULL, 
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM ticket;



CREATE TABLE food (
	food_id SERIAL PRIMARY KEY, 
	food_name varchar(50),
	price numeric(4, 2),
	customer_id integer NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

SELECT * FROM food;



--LOCATION
CREATE TABLE LOCATION (
	location_id SERIAL PRIMARY KEY,
	loc_name varchar(20),
	address varchar(50)
);

SELECT * FROM LOCATION;



--MOVIE
CREATE TABLE movie (
	movie_id SERIAL PRIMARY KEY,
	movie_name varchar(50),
	description varchar(225),
	runtime integer
);

SELECT * FROM movie;



--THEATER
CREATE TABLE theater (
	theater_id SERIAL PRIMARY KEY,
	theater_number integer,
	seats_total integer
);

SELECT * FROM theater;



--SEAT
CREATE TABLE seat (
	seat_id SERIAL PRIMARY KEY,
	seat_row varchar(1),
	seat_number integer,
	theater_id integer NOT NULL,
	FOREIGN KEY (theater_id) REFERENCES theater (theater_id)
);

SELECT * FROM seat;


--now ADD previous CONNECTION TO FOREIGN keys NOT referenced before
--FOR TICKET TABLE, ADD movie_id, theater, seat, location
ALTER TABLE ticket
ADD COLUMN movie_id integer NOT NULL;

SELECT * FROM ticket;

ALTER TABLE ticket 
ADD FOREIGN KEY (movie_id) REFERENCES movie (movie_id);


ALTER TABLE ticket 
ADD COLUMN theater_id integer NOT NULL,
ADD COLUMN seat_id integer NOT NULL;

ALTER TABLE ticket 
ADD COLUMN location_id integer NOT NULL,
add foreign key (theater_id) references theater (theater_id),
add foreign key (seat_id) references seat (seat_id),
add foreign key (location_id) references LOCATION (location_id);

SELECT * FROM ticket ;


ALTER TABLE LOCATION 
RENAME TO location_ ;

SELECT * FROM location_;





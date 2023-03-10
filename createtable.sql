DROP TABLE IF EXISTS Train;
CREATE TABLE Train
(
	train_number                INT          NOT NULL,
	train_name                  VARCHAR(16)  NOT NULL,
	premium_fare                INT          NOT NULL,
	general_fare                INT          NOT NULL,
	source_station              VARCHAR(16)  NOT NULL,
	destination_station         VARCHAR(16)  NOT NULL,
	available_on                VARCHAR(30)  NOT NULL,
	PRIMARY KEY (train_number),
	UNIQUE (train_number)
);

DROP TABLE IF EXISTS Train_status;
CREATE TABLE Train_status
(
	train_date                  CHAR(10)     NOT NULL,
	train_name                  VARCHAR(16)  NOT NULL,
	premium_seats_available     INT          NOT NULL,
	gen_seats_available         INT          NOT NULL,
	premium_seats_occupied      INT          NOT NULL,
	gen_seats_occupied          INT          NOT NULL,
	FOREIGN KEY (train_name) references Train(train_name)
);
 
DROP TABLE IF EXISTS Passenger;
CREATE TABLE Passenger
(
	first_name                  VARCHAR(16)  NOT NULL,
	last_name                   VARCHAR(16)  NOT NULL,
	address                     VARCHAR(20)  NOT NULL,
	city                        VARCHAR(16)  NOT NULL,
	county                      VARCHAR(16)  NOT NULL,
	phone                       CHAR(12)     NOT NULL,
	ssn                         INT          NOT NULL,
	bdate                       VARCHAR(10)  NOT NULL,
	PRIMARY KEY (ssn),
	UNIQUE (ssn));

DROP TABLE IF EXISTS Booked;
CREATE TABLE Booked
(
	passenger_ssn               INT          NOT NULL,
	train_number                INT          NOT NULL,
	ticket_type                 CHAR(7)      NOT NULL,	
	status                      VARCHAR(6)   NOT NULL,
	FOREIGN KEY (passenger_ssn) references Passenger(ssn),
    FOREIGN KEY (train_number) references Train(train_number)
);

.mode csv data 

.import Train.csv Train
.import Train_status.csv Train_status
.import Passenger.csv Passenger
.import booked.csv Booked

.mode column
.header on

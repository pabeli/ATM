USE ATMDW;

CREATE TABLE DTCards(
	card_num bigint NOT NULL,
	card_type varchar(255) NOT NULL,
    CONSTRAINT PK_DTCards PRIMARY KEY (card_num)
);

CREATE TABLE DTDate(
	date_id int NOT NULL,
	full_date date NOT NULL,
	date_year int NOT NULL,
	date_month int NOT NULL,
	date_day int NOT NULL,
	date_weekday int NOT NULL,
	date_hour int NOT NULL,
	month_name varchar(20) NOT NULL,
	date_quarter int NOT NULL,
	day_of_year int NOT NULL,
	number_of_week int NOT NULL,
	weekday_name varchar(20) NOT NULL,
    CONSTRAINT PK_DTDate PRIMARY KEY (date_id)
);

CREATE TABLE DTWeather(
	weather_id int NOT NULL,
	weather_main varchar(255) NOT NULL, 
	weather_description varchar(255) NOT NULL,
   
   CONSTRAINT PK_DTWeather PRIMARY KEY (weather_id)
);

CREATE TABLE DTLocation(
	atm_id int NOT NULL,
	atm_lat float NOT NULL,
	atm_lon float NOT NULL,
	atm_street_number int NOT NULL,
	atm_streetname varchar(255) NOT NULL,
	atm_location varchar(255) NOT NULL,
	atm_zipcode int NOT NULL,

    CONSTRAINT PK_DTLocation PRIMARY KEY (atm_id)
);

CREATE TABLE DTResults(
	message_code int NOT NULL,
	message_text varchar(255) NOT NULL,

	CONSTRAINT PK_DTResults PRIMARY KEY (message_code)
);


CREATE TABLE FTATMTransaction(
	weather_id int NOT NULL,
	card_num bigint NOT NULL,
	date_id int NOT NULL,
	atm_id int NOT NULL,
	message_code int NOT NULL,
	amount_successful float NOT NULL,
	amount_failed float NOT NULL,
	atm_status varchar(10) NOT NULL,

    CONSTRAINT PK_ATMTransaction PRIMARY KEY (weather_id,card_num,date_id,atm_id),
    FOREIGN KEY (weather_id) REFERENCES DTWeather(weather_id),
    FOREIGN KEY (card_num) REFERENCES DTCards(card_num),
    FOREIGN KEY (date_id) REFERENCES DTDate(date_id),
    FOREIGN KEY (atm_id) REFERENCES DTLocation(atm_id),
    FOREIGN KEY (message_code) REFERENCES DTResults(message_code)
);

USE music_store_db;

DROP TRIGGER IF EXISTS update_product_inventory;
CREATE TRIGGER update_product_inventory
AFTER INSERT ON invoice_line_items 
FOR EACH ROW
  UPDATE products 
     SET stock_in_hand = stock_in_hand - NEW.quantity
   WHERE product_id = NEW.product_id;

DROP PROCEDURE IF EXISTS populate_data;
DELIMITER //
CREATE PROCEDURE populate_data()
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
  SET sql_error = true;
  START TRANSACTION;
	-- Dumping data for table `countries`
	INSERT INTO `countries` VALUES (1,'Kazakhstan'),(2,'Gibraltar'),(3,'Tonga'),(4,'Brazil'),(5,'Gabon'),(6,'Paraguay'),(7,'United States of America'),(8,'Zimbabwe'),(9,'Georgia'),(10,'Hong Kong'),(11,'French Southern Territories'),(12,'Tajikistan'),(13,'Korea'),(14,'Mauritania'),(15,'Chad'),(16,'Saudi Arabia'),(17,'Tanzania'),(18,'Congo'),(19,'Japan'),(20,'Northern Mariana Islands');

	-- Dumping data for table `provinces`
	INSERT INTO `provinces` VALUES (1,'Texas',7),(2,'Wyoming',7),(3,'Nevada',7),(4,'Maryland',7),(5,'Georgia',7),(6,'Minnesota',7),(7,'Oregon',7),(8,'Indiana',7),(9,'Hawaii',7),(10,'Utah',7),(11,'NewYork',7),(12,'SouthDakota',7),(13,'Wisconsin',7),(14,'Iowa',7),(15,'RhodeIsland',7),(16,'Washington',7),(17,'Pennsylvania',7),(18,'District of Columbia',7),(19,'Oklahoma',7),(20,'Illinois',7),(21,'Ohio',7),(22,'Alaska',7),(23,'Vermont',7),(24,'NewMexico',7),(25,'California',7),(26,'Michigan',7),(27,'NewHampshire',7),(28,'SouthCarolina',7),(29,'Idaho',7),(30,'Maine',7),(31,'NorthDakota',7),(32,'Tennessee',7),(33,'Kentucky',7),(34,'NewJersey',7),(35,'Louisiana',7),(36,'WestVirginia',7),(37,'Arkansas',7),(38,'Alabama',7),(39,'Arizona',7),(40,'NorthCarolina',7),(41,'Connecticut',7),(42,'Missouri',7),(43,'Colorado',7),(44,'Nebraska',7),(45,'Delaware',7),(46,'Montana',7),(47,'Virginia',7),(48,'Massachusetts',7),(49,'Mississippi',7),(50,'Florida',7);

	-- Dumping data for table `cities`
	INSERT INTO `cities` VALUES (1,'Los Angeles',25),(2,'San Jose',25),(3,'San Diego',25),(4,'Columbus',21),(5,'Dallas',1),(6,'San Francisco',25),(7,'Indianapolis',8);

	-- Dumping data for table `product_types`
	INSERT INTO `product_types` VALUES (1,'Singles'),(2,'Album');

	-- Dumping data for table `genres`
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('EDM');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Rock');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Jazz');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Dubstep');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Blues');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Techno');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Country');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Electro');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Pop');
	INSERT INTO `music_store_db`.`genres` (`genre_name`) VALUES ('Indie');

	-- Dumping data for table `artists`
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Juice', 'Wrld', 'Juice Wrld, the professional name of Jarad Anthony Higgins, an American rapper, singer, and songwriter who has 44.08 million monthly listeners. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Maroon 5', 'Maroon 5 is a pop-rock band so famous you’ve most likely listened to one of their songs even if you don’t like its style, with 3 Grammy awards and over 6 albums released.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Ozuna', 'Ozuna, is a Puerto Rican reggaeton singer, who has 44.26 million listeners per month on Spotify.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Harry', 'Styles', 'A singer, songwriter, and actor that’s a part of one of the best-selling boy bands of all time (One Direction), Harry Styles is at 44.38 million listeners per month on Spotify.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Selena', 'Gomez', 'In the 16th spot in our list of the most popular artists on Spotify, we have Selena Gomez with 44.49 million listeners per month. At merely 28 years old, she already is one of the most popular pop singers in the US. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Travis', 'Scott', 'Jacques Bermon Webster II is an American singer and rapper most well-known as Travis Scott. In 2018, his well-acclaimed album Astroworld was released, and he reached the Billboard Hot 100 with the Sicko Mode single. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Post', 'Malone', 'An American rapper and singer, Post Malone is known for his introspective lyrics. His genres are extremely varied and include country, grunge, rap, and R&B. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Nicki', 'Minaj', 'Nicki Minaj is Onika Tanya Maraj’s artistic name, a world-wide famous American hip-hop artist that currently sits at 44.09 million listeners per month on Spotify. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Lady', 'Gaga', 'Stefani Joanne Angelina Germanotta Is by far one of the most popular artists on Spotify, known as Lady Gaga. She is an American singer-songwriter that is very well-known for her LGBT and anti-bullying activism and non-profit organizations. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Jason', 'Derulo', 'Jason Derulo is an American singer whose career started in 2009, and, since then, has sold over 30 million singles and has achieved eleven Platinum singles.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Marshmello', 'An American electronic music producer and DJ, Marshmello was first internationally recognized by making and releasing remixes for songs of a DJ duo Jack Ü, and DJ Zedd. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Khalid', 'Khalid is an American singer who has been named by Time magazine as one of the 100 most influential people in 2019. He has multiple awards, including 6 Grammys, 3 American Music Awards, and an MTV Video Music Award. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Ariana', 'Grande', 'Currently at over 50.90 million listeners per month, Ariana Grande is a 27-year-old north-American singer and actress. Her first album made in a studio was released in 2013, with her The Way song reaching Billboard Hot 100’s top 10. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Cardi B', 'Cardi B is an extremely famous personality, who works as a rapper, songwriter, and actress. She went viral when her posts and videos on Vine and Instagram got popular.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Ed', 'Sheeran', 'The 27-year-old English singer is the biggest name in the Folk genre. His first three albums were named “+”, “x”, “-“, respectively, and his latest, released in 2019, broke the trend, as “No.6 Collaborations Project”. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Justin', 'Bieber', 'Justin Bieber has been one of the most famous artists in the world for years, reaching the spotlight in 2010 with his hit Baby. On Spotify, he’s at 53.17 million listeners per month.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_last_name`, `artist_description`) VALUES ('Dua', 'Lipa', 'An English singer and songwriter, Dua Lipa first worked as a model up to 2015, when she signed with Warner Music Group in 2015, and released her self-titled first album in 2017.');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('J Balvin', 'A reggaeton singer of Colombian origin is J Balvin, who has been referred to as the “Prince of Reggaeton”. He is certainly one of the best-selling Latin artists at over 35 million records sold worldwide. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('Drake', 'Drake is a world-famous Canadian rapper and singer. At 62.08 million listeners per month, he easily snags the 2nd spot in our list with the most popular artists on Spotify. ');
	INSERT INTO `music_store_db`.`artists` (`artist_first_name`, `artist_description`) VALUES ('The Weeknd', 'Finally, taking the top spot with 65.10 million listeners, we have The Weeknd, a Canadian singer that is responsible for one of the most popular songs in 2015, Can’t Feel My Face. ');

	-- Dumping data for table `terms`
	INSERT INTO `music_store_db`.`terms` (`term_description`) VALUES ('Payment in 10 Days.');
	INSERT INTO `music_store_db`.`terms` (`term_description`) VALUES ('Payment in 30 Days.');
	INSERT INTO `music_store_db`.`terms` (`term_description`) VALUES ('Payment in 60 Days.');

	-- Dumping data for table `discounts`
	INSERT INTO `discounts` VALUES (1,'SUMMER FEVER',15.00,'2020-03-01','2020-05-30'),(2,'WINTER FREEZE',30.00,'2020-10-01','2020-12-30'),(3,'SPRING FLING',20.00,'2020-07-01','2020-08-01');

	-- Dumping data for table `customers`
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Micheal', 'Scott', '1234567890', 'michealscot@gmail.com', '1996-12-28', 'Baker Street', '1', '25', '7', '144410');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Pam', 'Halpert', '1254667890', 'pam@gmail.com', '1984-05-08', 'Sun Street', '1', '25', '7', '144520');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Jim', 'Halpert', '1234667890', 'jimH@gmail.com', '1980-01-10', 'Sun Street', '1', '25', '7', '144520');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Kelly', 'Kapoor', '987564312', 'kelly@gmail.com', '1988-11-18', 'Iron Street', '1', '25', '7', '144712');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Ryan', 'Howard', '798465123', 'ryan@gmail.com', '1984-05-28', 'Baker Street', '1', '25', '7', '144410');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Stanley', 'Hudson', '798465123', 'Stanley@gmail.com', '1980-05-28', 'Fun Street', '1', '25', '7', '144410');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Angela', 'Martin', '794665123', 'angela@gmail.com', '1988-10-04', 'Christ Street', '1', '25', '7', '145410');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Kevin', 'Malon', '963852741', 'kevin@gmail.com', '1990-02-28', 'Bagel Street', '1', '25', '7', '144412');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Creed', 'Bratton', '741852963', 'Creed@gmail.com', '1978-07-16', 'Old Street', '1', '25', '7', '144410');
	INSERT INTO `music_store_db`.`customers` (`customer_first_name`, `customer_last_name`, `customer_phone`, `customer_email`, `customer_dob`, `customer_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Andy', 'Benard', '852963741', 'andy@gmail.com', '1991-10-16', 'Dance Street', '1', '25', '7', '144410');

	-- Dumping data for table `products`
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Queen', '50', '2', '2', '8', '2019-10-16', '2');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Pink Friday', '60', '2', '2', '8', '2010-12-06', '2');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Megatron', '80', '2', '2', '8', '2021-01-10', '2');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Watermelon Sugar', '100', '3', '1', '4', '2020-10-06', '9');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Adore You', '70', '3', '1', '4', '2021-08-02', '9');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Golden', '90', '1', '1', '4', '2020-07-02', '9');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Beaitiful Mistakes', '50', '1', '2', '2', '2021-08-01', '2');
	INSERT INTO `music_store_db`.`products` (`product_name`, `product_selling_price`, `discount_id`, `product_type_id`, `artist_id`, `product_released_date`, `genre_id`) 
	VALUES ('Sugar', '100', '1', '1', '2', '2021-08-01', '2');

	-- Dumping data for table `employees
	INSERT INTO `music_store_db`.`employees` (`employee_first_name`, `employee_last_name`, `employee_phone`, `employee_dob`, `employee_doj`, `employee_email`, `employee_street_name`, `city_id`, `province_id`, `country_id`, `zipcode`) 
	VALUES ('Jan', 'Levenson', '963258741', '1994-12-10', '2010-10-10', 'jan@gmail.com', 'Uppper Street', '4', '25', '7', '124563');

	-- Dumping data for table `invoices'
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV001', '1', '2021-04-12', '500', '2021-05-01', '2', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV002', '1', '2021-03-28', '1000', '2021-05-01', '3', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV003', '2', '2020-12-01', '200', '2020-12-11', '1', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV004', '2', '2021-01-15', '450', '2021-02-16', '2', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV005', '3', '2021-02-15', '120', '2021-05-16', '3', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV006', '3', '2021-03-10', '130', '2021-03-20', '1', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV007', '4', '2021-02-15', '200', '2021-03-16', '2', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV008', '4', '2021-04-13', '1510', '2021-04-24', '1', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV009', '5', '2021-02-05', '140', '2021-03-16', '1', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV010', '5', '2021-03-16', '190', '2021-04-17', '2', '1');
    
    INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV011', '6', '2021-04-16', '330', '2021-05-17', '2', '1');
    INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV012', '7', '2021-04-16', '770', '2021-05-17', '2', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV013', '8', '2021-04-12', '200', '2021-06-16', '3', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV014', '9', '2021-04-15', '270', '2021-06-16', '3', '1');
	INSERT INTO `music_store_db`.`invoices` (`invoice_number`, `customer_id`, `invoice_date`, `invoice_total`, `invoice_due_date`, `term_id`, `empolyee_id`) VALUES ('INV015', '10', '2021-04-15', '200', '2021-05-16', '2', '1');

	-- Dumping data for table `invoice_line_items'
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (1, 4, 3, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (1, 8, 2, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (2, 8, 4, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (2, 4, 3, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (2, 1, 2, 50.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (2, 7, 2, 50.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (3, 2, 2, 60.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (3, 3, 1, 80.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (4, 6, 2, 90.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (4, 4, 1, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (4, 5, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (4, 8, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (5, 2, 2, 60.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (6, 1, 1, 50.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (6, 3, 1, 80.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (7, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (7, 2, 1, 60.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (8, 4, 5, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (8, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (8, 6, 3, 90.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (8, 7, 2, 50.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (8, 8, 5, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (9, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (10, 4, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (10, 6, 1, 90.00, 0.0);
    
    INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (11, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (11, 4, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (11, 6, 1, 90.00, 0.0);

	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (12, 4, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (12, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (12, 6, 3, 90.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (12, 3, 2, 80.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (12, 8, 1, 100.00, 0.0);
  
  	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (13, 5, 2, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (13, 2, 1, 60.00, 0.0);
  
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (14, 4, 1, 70.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (14, 5, 1, 100.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (14, 8, 1, 100.00, 0.0);  
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (15, 2, 2, 60.00, 0.0);
	INSERT INTO `music_store_db`.`invoice_line_items` (`invoice_id`, `product_id`, `quantity`, `unit_price`, `discount_amount`) VALUES (15, 3, 1, 80.00, 0.0);
  
  IF sql_error = FALSE THEN
     COMMIT; 
     SELECT 'All data into Music Store Database was populated successfully.' AS message;
  ELSE
     ROLLBACK;
     SELECT 'There was an error while populating data into Music Store Database.';
  END IF;
END//
DELIMITER ;

CALL populate_data();
-- ======================================================================================


-- ======================================================================================
-- View for Query no. 1
USE music_store_db;
DROP VIEW IF EXISTS clients_spent_more_than_avg_spent_in_past_month;
CREATE VIEW clients_spent_more_than_avg_spent_in_past_month AS
    SELECT 
        customers.*, SUM(invoice_total) AS customer_total_spent
    FROM
        invoices
            JOIN
        customers USING (customer_id)
    GROUP BY customer_id
    HAVING customer_total_spent > (SELECT 
            AVG(invoice_total) AS avg_invoice_total
        FROM
            invoices
        WHERE
            MONTH(invoice_date) = MONTH(NOW()) - 1
                AND YEAR(invoice_date) = YEAR(NOW()));
-- ======================================================================================

-- ======================================================================================
-- Views for Query no. 2
USE music_store_db;
DROP VIEW IF EXISTS products_sold_times;
CREATE VIEW products_sold_times (product_id , product_name , sold_times) AS
    SELECT 
        product_id, product_name, SUM(quantity) AS sold_times
    FROM
        invoice_line_items
            JOIN
        products USING (product_id)
            JOIN
        invoices USING (invoice_id)
    WHERE
        invoice_date > DATE_SUB(NOW(), INTERVAL 7 Day)
            AND invoice_date <= NOW()
    GROUP BY product_id;

DROP VIEW IF EXISTS top_and_least_sold_products_in_week;
CREATE VIEW top_and_least_sold_products_in_week AS
    SELECT 
        *
    FROM
        products_sold_times
    WHERE
        sold_times = (SELECT 
                MAX(sold_times)
            FROM
                products_sold_times) 
    UNION SELECT 
        *
    FROM
        products_sold_times
    WHERE
        sold_times = (SELECT 
                MIN(sold_times)
            FROM
                products_sold_times);
-- ======================================================================================

-- ======================================================================================
-- View for Query no. 3
USE music_store_db;
DROP VIEW IF EXISTS most_expensive_product_per_genre;
CREATE VIEW most_expensive_product_per_genre AS
SELECT 
    genres.*, MAX(product_selling_price) AS max_price_product
FROM
    products
        JOIN
    genres USING (genre_id)
GROUP BY genre_id;
-- ======================================================================================

-- ======================================================================================
-- View for Query no. 4
USE music_store_db;
DROP VIEW IF EXISTS customers_per_city_province_country;
CREATE VIEW customers_per_city_province_country AS
    SELECT 
        city_name AS city_province_country_name,
        COUNT(*) AS number_of_customers
    FROM
        customers c
            JOIN
        cities ct ON c.city_id = ct.city_id
            JOIN
        provinces p ON ct.province_id = p.province_id
            JOIN
        countries con ON p.country_id = con.country_id
    GROUP BY ct.city_id 
    UNION SELECT 
        province_name AS city_province_country_name,
        COUNT(*) AS number_of_customers
    FROM
        customers c
            JOIN
        cities ct ON c.city_id = ct.city_id
            JOIN
        provinces p ON ct.province_id = p.province_id
            JOIN
        countries con ON p.country_id = con.country_id
    GROUP BY p.province_id 
    UNION SELECT 
        country_name AS city_province_country_name,
        COUNT(*) AS number_of_customers
    FROM
        customers c
            JOIN
        cities ct ON c.city_id = ct.city_id
            JOIN
        provinces p ON ct.province_id = p.province_id
            JOIN
        countries con ON p.country_id = con.country_id
    GROUP BY con.country_id
    ORDER BY number_of_customers DESC;
-- ======================================================================================

-- ======================================================================================
-- Store Procedure for Query no. 5
USE music_store_db;
DROP PROCEDURE IF EXISTS products_sold_in_the_month;
DELIMITER //
CREATE PROCEDURE products_sold_in_the_month(month_number INT)
BEGIN
	SELECT 
		SUM(quantity) AS total_products_sold
	FROM
		invoice_line_items
			JOIN
		invoices USING (invoice_id)
	WHERE
		MONTH(invoice_date) = month_number
			AND YEAR(invoice_date) = YEAR(NOW());
END //
DELIMITER ;
-- ======================================================================================

-- ======================================================================================
-- View for Query no. 6
USE music_store_db;
DROP VIEW IF EXISTS distinct_albums_per_singer;
CREATE VIEW distinct_albums_per_singer AS
SELECT 
    product_type_id,
    artist_id,
    artist_first_name,
    artist_last_name,
    COUNT(*) AS number_of_albums
FROM
    products
        JOIN
    artists USING (artist_id)
GROUP BY artist_id
HAVING product_type_id = 2;
-- ======================================================================================

-- ======================================================================================
-- View for Query no. 7
USE music_store_db;
DROP VIEW IF EXISTS albums_inventory_per_singer;
CREATE VIEW albums_inventory_per_singer AS
    SELECT 
        artist_id,
        artist_first_name,
        artist_last_name,
        product_name,
        stock_in_hand AS 'Copies Available'
    FROM
        artists
            JOIN
        products USING (artist_id)
    WHERE
        product_type_id = 2
    ORDER BY artist_first_name;
-- ======================================================================================

-- ======================================================================================
-- Views for Query no. 8
USE music_store_db;
DROP VIEW IF EXISTS artists_total_products_sold_in_the_month;
CREATE VIEW artists_total_products_sold_in_the_month AS
    SELECT 
        artists.*, SUM(quantity) AS products_sold
    FROM
        artists
            JOIN
        products USING (artist_id)
            JOIN
        invoice_line_items USING (product_id)
            JOIN
        invoices USING (invoice_id)
    WHERE
        MONTH(invoice_date) = MONTH(NOW())
            AND YEAR(invoice_date) = YEAR(NOW())
    GROUP BY artist_id;

DROP VIEW IF EXISTS top_trending_artists_of_the_month;
CREATE VIEW top_trending_artists_of_the_month AS
    SELECT 
        *
    FROM
        artists_total_products_sold_in_the_month
    WHERE
        products_sold = (SELECT 
                MAX(products_sold)
            FROM
                artists_total_products_sold_in_the_month);
-- ======================================================================================    

-- ======================================================================================
-- View for Query no. 9
USE music_store_db;
Drop view IF EXISTS customers_upcoming_birthday;
CREATE VIEW customers_upcoming_birthday AS
    SELECT 
        *
    FROM
        customers
    WHERE
        MONTH(customer_dob) = MONTH(NOW()) + 1;
-- ======================================================================================
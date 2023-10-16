-- ================================================================================================
-- 1. Display a list of clients that spent more than the average spent by client in the past month.
USE music_store_db;            
SELECT 
    *
FROM
    clients_spent_more_than_avg_spent_in_past_month;
-- ================================================================================================


-- =============================================================
-- 2. The top sold products and least sold products over a week.           
USE music_store_db;
SELECT 
    *
FROM
    top_and_least_sold_products_in_week;
-- =============================================================


-- ==============================================================================================
-- 3. The maximum price of products in the same genre (for example, rock, pop, country, hip-hop). 
--    Use GROUP BY to list all the genres and their maximum price.            
USE music_store_db;
SELECT 
    *
FROM
    most_expensive_product_per_genre;
-- ==============================================================================================


-- ========================================================================================================
-- 4. List how many customers the system has by location (Country, Province, and City), and then sort them.    
USE music_store_db;
SELECT 
    *
FROM
    customers_per_city_province_country;
-- ========================================================================================================


-- ====================================================================
-- 5. List how many products the store has sold for a particular month.
USE music_store_db;
CALL products_sold_in_the_month(2);
-- ====================================================================


-- =================================================
-- 6. List how many distinct albums each singer has.
USE music_store_db;
SELECT 
    *
FROM
    distinct_albums_per_singer;
-- =================================================


-- =========================================================================
-- 7. List how many copies of an album are available of a particular singer.
USE music_store_db;
SELECT 
    *
FROM
    albums_inventory_per_singer;
-- =========================================================================


-- ======================================
-- 8. Top Trending Artist/s of the month.
USE music_store_db;
SELECT 
    artist_id,
    artist_first_name,
    artist_last_name,
    products_sold
FROM
    top_trending_artists_of_the_month;
-- ======================================


-- =====================================================================================
-- 9. (Upcoming Birthdays) List all customers whose having their birthday in next month.
USE music_store_db;
SELECT 
    *
FROM
    customers_upcoming_birthday;
-- =====================================================================================
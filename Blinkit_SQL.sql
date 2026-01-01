Use Blinkit_data;

select * from blinkit_sales;

Select count(*) from blinkit_sales;

SELECT * FROM blinkit_sales LIMIT 10;

describe blinkit_sales;

select sum(sales) as total_sales
	from blinkit_sales;
    
SELECT item_type, SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY item_type
ORDER BY total_sales DESC LIMIT 5;

select avg(sales) as avg_sales
	from blinkit_sales;

select avg(rating) as avg_rating
	from blinkit_sales;
    
SELECT item_type,
       SUM(sales) AS total_sales,
       AVG(rating) AS avg_rating
FROM blinkit_sales
GROUP BY item_type
HAVING avg_rating < 3.5
ORDER BY total_sales DESC;

select count(*) as total_transactions
	from blinkit_sales;

UPDATE blinkit_sales
SET item_fat_content = 
    CASE
        WHEN LOWER(item_fat_content) IN ('lf', 'low fat') THEN 'Low Fat'
        WHEN LOWER(item_fat_content) IN ('reg', 'regular') THEN 'Regular'
        ELSE item_fat_content
    END;

SELECT item_type, SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY item_type
ORDER BY total_sales DESC;

SELECT outlet_type, SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY outlet_type;

SELECT outlet_location_type, SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY outlet_location_type;

SELECT outlet_establishment_year, SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;

SELECT item_fat_content,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(AVG(sales) AS DECIMAL(10,0)) AS avg_sales,
    CAST(AVG(rating) AS DECIMAL(10,1)) AS avg_rating,
    COUNT(*) AS no_of_items
FROM blinkit_sales
GROUP BY item_fat_content;

SELECT item_type,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales
FROM blinkit_sales
GROUP BY item_type
ORDER BY total_sales DESC;

SELECT outlet_location_type,
    IFNULL(SUM(CASE WHEN item_fat_content = 'Low Fat' THEN sales END), 0) AS low_fat_sales,
    IFNULL(SUM(CASE WHEN item_fat_content = 'Regular' THEN sales END), 0) AS regular_sales
FROM blinkit_sales
GROUP BY outlet_location_type
ORDER BY outlet_location_type;

SELECT outlet_size,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(
        SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()
        AS DECIMAL(10,2)
    ) AS sales_percentage
FROM blinkit_sales
GROUP BY outlet_size
ORDER BY total_sales DESC;

SELECT outlet_type,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(AVG(sales) AS DECIMAL(10,0)) AS avg_sales,
    COUNT(*) AS no_of_items,
    CAST(AVG(rating) AS DECIMAL(10,2)) AS avg_rating,
    CAST(AVG(item_visibility) AS DECIMAL(10,2)) AS avg_item_visibility
FROM blinkit_sales
GROUP BY outlet_type
ORDER BY total_sales DESC;

SELECT 
    CASE 
        WHEN outlet_establishment_year < 2000 THEN 'Old'
        WHEN outlet_establishment_year BETWEEN 2000 AND 2010 THEN 'Mid'
        ELSE 'New'
    END AS outlet_age_group,
    SUM(sales) AS total_sales
FROM blinkit_sales
GROUP BY outlet_age_group;





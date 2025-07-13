-- 1. Overall count of records
SELECT COUNT(*) AS total_properties FROM real_estate;

-- 2. Average property price overall
SELECT ROUND(AVG(price), 2) AS avg_price FROM real_estate;

-- 3. Average price per ZIP code (location-wise analysis)
SELECT zipcode, COUNT(*) AS num_properties, ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY zipcode
ORDER BY avg_price DESC
LIMIT 10;

-- 4. Monthly price trends (is the market going up/down?)
SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY month
ORDER BY month;

-- 5. Bedrooms vs. price (how does bedroom count affect value?)
SELECT 
    bedrooms, 
    COUNT(*) AS total,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY bedrooms
ORDER BY bedrooms;

-- 6. Renovated vs Not Renovated homes - price comparison
SELECT 
    CASE 
        WHEN yr_renovated = 0 THEN 'Not Renovated' 
        ELSE 'Renovated' 
    END AS renovation_status,
    COUNT(*) AS total,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY renovation_status;

-- 7. Waterfront properties - do they demand higher price?
SELECT 
    waterfront,
    COUNT(*) AS total,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY waterfront;

-- 8. Correlation proxy: Does more sqft living = higher price?
SELECT 
    sqft_living,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY sqft_living
ORDER BY sqft_living DESC
LIMIT 20;

-- 9. Condition vs Price - do better-maintained houses cost more?
SELECT 
    cndition,
    COUNT(*) AS total,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY cndition
ORDER BY cndition DESC;

-- 10. Top 10 most expensive properties (for buyer insights)
SELECT *
FROM real_estate
ORDER BY price DESC
LIMIT 10;

-- 11. How are prices distributed across different brackets?
SELECT 
    CASE 
        WHEN price < 200000 THEN '< $200K'
        WHEN price BETWEEN 200000 AND 500000 THEN '$200K–500K'
        WHEN price BETWEEN 500001 AND 1000000 THEN '$500K–1M'
        ELSE '> $1M'
    END AS price_bracket,
    COUNT(*) AS property_count
FROM real_estate
GROUP BY price_bracket
ORDER BY property_count DESC;

-- 12. Do newer homes command higher prices?
SELECT 
    CASE 
        WHEN yr_built >= 2000 THEN 'New'
        WHEN yr_built BETWEEN 1980 AND 1999 THEN 'Modern'
        ELSE 'Old'
    END AS age_category,
    COUNT(*) AS total,
    ROUND(AVG(price), 2) AS avg_price
FROM real_estate
GROUP BY age_category;
 

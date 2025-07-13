CREATE DATABASE real_estate_analysis;
USE real_estate_analysis;

CREATE TABLE real_estate (
    id BIGINT PRIMARY KEY,
    date DATE,
    price INT,
    bedrooms INT,
    bathrooms FLOAT,
    sqft_living INT,
    sqft_lot INT,
    floors FLOAT,
    waterfront INT,
    view INT,
    cndition INT,
    grade INT,
    sqft_above INT,
    sqft_basement INT,
    yr_built INT,
    yr_renovated INT,
    zipcode VARCHAR(10),
    lat FLOAT,
    longi FLOAT,
    sqft_living15 INT,
    sqft_lot15 INT
);

SELECT COUNT(*) FROM real_estate;
SELECT * FROM real_estate LIMIT 10;

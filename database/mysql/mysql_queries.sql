-- database/mysql/mysql_queries.sql

-- Create a database for Skycast Weather
CREATE DATABASE IF NOT EXISTS skycast_weather;

-- Use the Skycast Weather database
USE skycast_weather;

-- Create a table to store weather data
CREATE TABLE IF NOT EXISTS weather_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    humidity INT NOT NULL,
    clear_sky BOOLEAN NOT NULL,
    speed INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO weather_data (location, humidity, clear_sky, speed)
VALUES ('Example City', 70, 1, 10);

-- Query to retrieve weather data
SELECT * FROM weather_data;

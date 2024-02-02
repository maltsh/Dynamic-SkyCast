-- database/queries.sql

-- Select all weather data
SELECT * FROM weather_data;

-- Select weather data for a specific location
SELECT * FROM weather_data WHERE location = 'YourLocation';

-- Insert new weather data
INSERT INTO weather_data (location, humidity, clear_sky, speed) VALUES ('NewCity', 60.0, 2, 15.0);

-- Update weather data for a specific location
UPDATE weather_data SET humidity = 65.0, clear_sky = 3, speed = 12.0 WHERE location = 'ExistingCity';

-- Delete weather data for a specific location
DELETE FROM weather_data WHERE location = 'CityToDelete';

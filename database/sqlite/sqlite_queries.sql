-- database/sqlite/sqlite_queries.sql

-- Create a table to store weather data
CREATE TABLE IF NOT EXISTS weather_data (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    location TEXT NOT NULL,
    humidity REAL NOT NULL,
    clear_sky INTEGER NOT NULL,
    speed REAL NOT NULL,
    date TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO weather_data (location, humidity, clear_sky, speed)
VALUES ('Example City', 70.0, 1, 10.0);

-- Query to retrieve weather data
SELECT * FROM weather_data;

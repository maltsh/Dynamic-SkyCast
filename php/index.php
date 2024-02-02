<!-- php/index.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Skycast Weather</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <div class="container">
        <div class="header">
            <h1>Skycast Weather</h1>
        </div>

        <div class="main-content">
            <div class="search-box">
                <input type="text" id="locationInput" placeholder="Enter your location">
                <button onclick="searchWeather()">Search</button>
            </div>

            <div class="weather-info">
                <h2>Current Weather</h2>
                <p id="currentLocation">Current Location: <span id="locationSpan">City, Country</span></p>
                <p>Humidity: <span id="humiditySpan">50%</span></p>
                <p>Clear Sky: <span id="clearSkySpan">Clear</span></p>
                <p>Speed: <span id="speedSpan">10 km/h</span></p>
                <p>Date: <span id="dateSpan">2023-11-26</span></p>
            </div>
        </div>
    </div>

    <script src="app.js"></script>
</body>
</html>

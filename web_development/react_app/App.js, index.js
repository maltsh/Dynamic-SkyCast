// web_development/react_app/App.js
import React, { useState } from 'react';

function App() {
    const [location, setLocation] = useState('');

    const handleSearch = () => {
        const locationInput = prompt('Enter your location:');
        if (locationInput !== null) {
            setLocation(locationInput);
            fetchWeatherData(locationInput);
        }
    };

    const fetchWeatherData = async (location) => {
        const apiKey = 'your_weather_api_key';
        const apiUrl = `https://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${location}`;

        try {
            const response = await fetch(apiUrl);
            const data = await response.json();
            // Update React state or components with data
            console.log(data);
        } catch (error) {
            console.error('Error fetching weather data:', error);
        }
    };

    return (
        <div>
            <button onClick={handleSearch}>Search</button>
            <p>Current Location: {location}</p>
            {/* Add components for displaying other weather information */}
        </div>
    );
}

export default App;

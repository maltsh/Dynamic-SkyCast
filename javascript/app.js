// web_development/app.js

		async function searchLocation() {
    // Get the input value from the text box
    var locationInput = document.getElementById("location").value;

    // Call the weather API (replace 'YOUR_API_KEY' with your actual API key)
    var apiKey = '0390c7c7aed6ad7fc3be2aff198053c9';
    var apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${locationInput}&appid=${apiKey}`;
    
    try {
      var response = await fetch(apiUrl);
      var data = await response.json();

      // Update the text in the rectangle2 and current-location elements
      document.getElementById("locationDisplay").innerText = locationInput;
      document.querySelector(".current-location").innerText = locationInput;

      // Update the levels based on weather data
      updateWeatherLevels(data.main.humidity, data.clouds.all, data.wind.speed);

      // Update the date based on weather data
      updateDate(data.dt);
      
      // Clear the input field
      document.getElementById("location").value = "";
    } catch (error) {
      console.error('Error fetching weather data:', error);
    }
}

function updateDate(timestamp) {
    // Convert timestamp to Date object
    var date = new Date(timestamp * 1000);

    // Format the date as desired (adjust format based on your preference)
    var formattedDate = `${date.getFullYear()}-${padZero(date.getMonth() + 1)}-${padZero(date.getDate())}`;

    // Update the text in the date element
    document.querySelector(".date").innerText = `DATE: ${formattedDate}`;
}

function updateWeatherLevels(humidity, clearSky, speed) {
    // Update the text in the humidity, clear-sky, and speed elements
    document.querySelector(".humidity").innerText = `Humidity: ${humidity}%`;
    document.querySelector(".clear-sky").innerText = `Clear Sky: ${clearSky}%`;
    document.querySelector(".speed").innerText = `Speed: ${speed} m/s`;
}

function padZero(number) {
    return number < 10 ? '0' + number : number;
}

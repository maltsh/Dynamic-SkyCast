// swift/main.swift
import Vapor
import HTTP

let app = try Application()

// Define a route for the home page
app.get("/") { req in
    return try app.view("index.html")
}

// Define a route to handle weather data retrieval
app.post("/get_weather") { req in
    guard let location = try? req.content.syncGet(String.self, at: "location") else {
        throw Abort(.badRequest, reason: "Invalid location")
    }

    // Replace 'YOUR_API_KEY' with your actual weather API key
    let apiKey = "YOUR_API_KEY"
    let apiUrl = "https://api.weatherapi.com/v1/current.json"
    
    // Make a request to the Weather API
    let response = try app.client().post(apiUrl) { req in
        try req.query.encode(["key": apiKey, "q": location])
    }
    
    // Decode the response JSON
    let weatherData = try response.content.decode(JSON.self)
    
    // Extract relevant weather information
    let weatherInfo = WeatherInfo(
        location: location,
        humidity: weatherData.current.humidity,
        clearSky: weatherData.current.condition.text,
        speed: weatherData.current.windKph,
        date: weatherData.location.localtime
    )

    // Render the weather information as JSON
    return try weatherInfo.encode(for: req)
}

try app.run()

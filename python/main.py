# python/main.py
from flask import Flask, render_template, request
import requests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_weather', methods=['POST'])
def get_weather():
    location = request.form['location']
    
    # Replace 'YOUR_API_KEY' with your actual weather API key
    api_key = 'YOUR_API_KEY'
    api_url = 'https://api.weatherapi.com/v1/current.json'
    
    params = {
        'key': api_key,
        'q': location
    }

    try:
        response = requests.get(api_url, params=params)
        data = response.json()
        
        weather_info = {
            'location': location,
            'humidity': data['current']['humidity'],
            'clear_sky': data['current']['condition']['text'],
            'speed': data['current']['wind_kph'],
            'date': data['location']['localtime']
        }

        return render_template('weather.html', weather_info=weather_info)

    except Exception as e:
        return f"Error fetching weather data: {str(e)}"

if __name__ == '__main__':
    app.run(debug=True)

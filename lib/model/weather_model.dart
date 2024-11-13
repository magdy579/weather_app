import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  DateTime date;
  String image;
  double temp_c;
  double minTemp;
  double maxTemp;
  // String whCondation;
  String country;
  String region;
  String weatherStateName;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp_c,
    required this.minTemp,
    required this.maxTemp,
    // required this.whCondation,
    required this.country,
    required this.region,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp_c: (json['current']['temp_c'] ?? 0.0).toDouble(),
      minTemp: (json['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0.0)
          .toDouble(),
      maxTemp: (json['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0.0)
          .toDouble(),
      // whCondation: json['current']['condition']['text'] ,
      image: json['current']['condition']['icon'],
      country: json['location']['country'],
      region: json['location']['region'],
      weatherStateName: json['current']['condition']['text'],
    );
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||

        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}

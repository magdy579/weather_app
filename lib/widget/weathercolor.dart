import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Patchy rain possible":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Patchy light rain":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
      return Colors.blue;
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.cyan;
    case "Patchy freezing drizzle possible":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.indigo;
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.amber;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepOrange;
    default:
      return Colors.blue;
  }
}
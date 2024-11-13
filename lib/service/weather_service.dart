

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wheaterapp/model/weather_model.dart';

class WeatherService{
  // final Dio dio=  Dio();
  final  String domain='https://api.weatherapi.com/v1';
  final String apikey='42b05180ade447ac8b314920242801';

  Future<WeatherModel> getCurrentService ({required String cityName})async{

           Uri url =
           Uri.parse('$domain/forecast.json?key=$apikey&q=$cityName&days=7');
           http.Response response = await http.get(url);
           if (response.statusCode == 400) {
             var data  = jsonDecode(response.body);
             throw Exception(data['error']['message']);
           }
           Map<String, dynamic> data = jsonDecode(response.body);
           WeatherModel weatherModel =WeatherModel.fromJson(data);
           return weatherModel;





  }

}

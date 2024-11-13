import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheaterapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheaterapp/main.dart';
import 'package:wheaterapp/model/weather_model.dart';
import 'package:wheaterapp/widget/weathercolor.dart';

class Info_Weather extends StatelessWidget {
  Info_Weather({Key? key, required this.weatherModel});
  final WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration: BoxDecoration(
          gradient:LinearGradient(colors:[
            getWeatherColor(weatherModel!.weatherStateName),
            getWeatherColor(weatherModel!.weatherStateName)[400]!,
            getWeatherColor(weatherModel!.weatherStateName)[100]!,
          ],begin:Alignment.topCenter,end: Alignment.bottomCenter)
      ),
      child: Padding(
        padding:const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Text(
                weatherModel!.cityName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ) ,
              Text("update at ${weatherModel!.date.hour}  o'clock",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800] ,
                ),
              ) ,
              Text(
                "${weatherModel!.country}-${weatherModel!.region}",
                style: const TextStyle(
                  fontSize: 16,

                ),
              ) ,

              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network('https:${weatherModel!.image}',


                    height: 200,
                  ),

                  Text(weatherModel!.temp_c.round().toString(),
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(weatherModel!.weatherStateName,
                        style: const TextStyle(
                          fontSize: 12,

                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ) ,
                      Text(" ${weatherModel!.maxTemp.round()}/ ${weatherModel!.minTemp.round()}",
                        style:  TextStyle(
                          fontSize: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,




            ],
          ),
        ),
      ),
    );
  }
}

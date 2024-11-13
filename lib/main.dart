import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheaterapp/service/weather_service.dart';
import 'package:wheaterapp/Scrrens/Homewheater.dart';
import 'package:wheaterapp/cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final weatherCubit = BlocProvider.of<WeatherCubit>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: weatherCubit.weatherModel == null
                ? Colors.blue
                : weatherCubit.weatherModel!.getThemeColor(),
          ),
          home: HomeView(),
        );
      },
    );
  }
}
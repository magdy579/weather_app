import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheaterapp/cubit/weather_cubit.dart';
import 'package:wheaterapp/Scrrens/SearchView.dart';
import 'package:wheaterapp/model/weather_model.dart';
import '../widget/nowheater.dart';
import '../widget/weather_info.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return NoWeather();
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return Info_Weather(weatherModel: weatherModel!);
          } else if (state is WeatherFailure) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 200),
                  Text(
                    "Error, Please Try Again",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheaterapp/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) {
              cityName = value;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter Your City',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wheaterapp/model/weather_model.dart';
import 'package:wheaterapp/service/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getCurrentService(cityName: cityName);
      emit(WeatherSuccess(weatherModel!));
    } on Exception {
      emit(WeatherFailure());
    }
  }
}

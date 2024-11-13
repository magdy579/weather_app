// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wheaterapp/cubits/get_weather_cubit/get-weather_state.dart';
//
// import '../../model/weather_model.dart';
// import '../../service/weather_service.dart';
//
// class GetWeatherCubit extends Cubit<WeatherState>{
//     WeatherModel? weatherModel;
//   GetWeatherCubit():super(InitialState());
//       getWeather({required String cityName})async{
//         try {
//            weatherModel =
//           await WeatherService(Dio()).getCurrentService(cityName: cityName) ;
//           emit(WeatherLoadState(weatherModel!))   ;
//         }  catch (e) {
//           emit(WeatherFailureState(
//              e.toString()
//           ))  ;
//         }
//
//       }
// }
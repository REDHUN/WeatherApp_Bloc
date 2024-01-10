import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/data/respository/weather_respository.dart';
import 'package:weatherapp/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRespository weatherRespository;
  WeatherBloc(this.weatherRespository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }
  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRespository.getCurrentWeather();
      emit(WeatherSccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}

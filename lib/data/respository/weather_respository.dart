// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weatherapp/data/data_provider/weather_data_provider.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherRespository {
  final WeatherDataProvider weatherProvider;
  WeatherRespository(
    this.weatherProvider,
  );

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final weatherData = await weatherProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      print("hello");
      throw e.toString();
    }
  }
}

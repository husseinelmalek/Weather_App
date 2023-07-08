import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? weatherData;
  set _weatherData(WeatherModel? weather){
    weatherData=weather;
    notifyListeners();
  }
  WeatherModel? get _weatherData => weatherData!;

}
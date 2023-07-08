import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class Services {
  Future<WeatherModel?> getWeather ({required String cityName}) async{
    WeatherModel? weatherModel;
   try{
     String baseUrl='http://api.weatherapi.com/v1';
     String apiKey='b4ee591d2d2a4049aa2165109233006';
     Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
     http.Response response= await http.get(url);
     Map<String ,dynamic> data=jsonDecode(response.body);
     weatherModel=WeatherModel.fromJson(data);
   }catch(e){
     print(e);
   }

    return weatherModel;


  }
}

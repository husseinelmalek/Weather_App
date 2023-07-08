

class WeatherModel {
   final String date;
   final String name;
   final double temp;
   final double maxTemp;
   final double minTemp;
   final String weatherStateName;
   final String icon;

  WeatherModel({
    required this.name,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
  });
  factory WeatherModel.fromJson(dynamic data){
    var jsonData=data['forecast']['forecastday'][0]['day'];
    print(jsonData);
    return WeatherModel(
      name: data['location']['name'],
      date: data['location']['localtime'],

        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        icon: jsonData['condition']['icon'],
    );

  }
  @override
  String toString(){
    return 'temp=$temp    minTemp=$minTemp    maxTemp=$maxTemp  weathersatate=$weatherStateName';
  }


}
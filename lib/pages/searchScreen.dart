
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/homeScreen.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/services.dart';


class SearchScreen extends StatelessWidget {
 //SearchScreen({this.updateUi}) ;
 // VoidCallback? updateUi;
String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                cityName=value;
              },
              onFieldSubmitted: (value) async {

                 Services services= Services();
                 WeatherModel? weather=await services.getWeather(cityName: value);
                 print (weather);
                 Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;


                   Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);

                 },

              decoration: InputDecoration(
                contentPadding: EdgeInsetsDirectional.symmetric(vertical: 40,horizontal: 10),
                label: Text('search'),
                suffixIcon: IconButton(onPressed: () async {
                  Services services= Services();
                  WeatherModel? weather=await services.getWeather(cityName: cityName!);
                  print (weather);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;


                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);

                },icon: Icon(Icons.search)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'search ...',


              ),


            ),
          ],
        ),
      ),
    );
  }
}

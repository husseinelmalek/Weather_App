import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/homeScreen.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}




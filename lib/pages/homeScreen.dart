import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/pages/searchScreen.dart';
import 'package:weather_app/providers/weather_provider.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? data;


  @override
  Widget build(BuildContext context) {
    data =Provider.of<WeatherProvider>(context,listen: true).weatherData;
    return  Scaffold(
      backgroundColor: Color(0xFFFFF4DA),
      appBar: AppBar(

        title: Text('WEATHER'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: data == null ?  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('there is no weather started ',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            Text('Searching now',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
              },
              child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                    child: Text(
                      'Next slide',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                    baseColor: Colors.red, highlightColor: Colors.yellow),
              ),
            ),
          ],
        ),
      ) :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.brown,
                Colors.greenAccent,
                Colors.blue,
              ],
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,



          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
            Text(data!.name,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),),
            Text('updated: ${data!.date}',
            style: TextStyle(fontSize: 22,),),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image(image:NetworkImage('https:${data!.icon}'),
                ),
                Text('${data!.temp}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),),
                Column(

                  children: [
                    Text('maxTemp : ${data!.maxTemp}'),
                    Text('maxTemp : ${data!.minTemp}'),

    ],
                ),
              ],
            ),
            Spacer(),
            Text(data!.weatherStateName,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),),
            Spacer(flex: 5,),


          ],
        ),
      ),

    );
  }
}
// Widget con({
//   String? text,
//   Color? color,
// })=>  Container(
//   padding: EdgeInsets.only(left: 16),
//   alignment: Alignment.centerLeft,
//   height: 65,
//   width: double.infinity,
//   color: color,
//   child: Text(text!,style: TextStyle(
//     color: Colors.white,
//     fontSize: 18,
//   ),),
// );
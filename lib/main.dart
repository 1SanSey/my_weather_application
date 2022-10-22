import 'package:flutter/material.dart';
import 'package:my_weather_application/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Weather Forecast App',
      home: LocationScreen(),
    );
  }
}

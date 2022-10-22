import 'package:flutter/material.dart';
import 'package:my_weather_application/api/weather_api.dart';
import 'package:my_weather_application/models/weather_forecast_daily.dart';
import 'package:my_weather_application/screens/city_screen.dart';
import 'package:my_weather_application/widgets/bottom_list_view.dart';
import 'package:my_weather_application/widgets/city_view.dart';
import 'package:my_weather_application/widgets/detail_view.dart';

import '../widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key, this.locationWeather})
      : super(key: key);

  final WeatherForecast? locationWeather;

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('openweathermap.org'),
        backgroundColor: const Color.fromARGB(255, 0, 140, 255),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
          icon: const Icon(Icons.my_location),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
            icon: const Icon(Icons.location_city),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50.0,
                        ),
                        CityView(snapshot: snapshot),
                        const SizedBox(
                          height: 50.0,
                        ),
                        TempView(snapshot: snapshot),
                        const SizedBox(
                          height: 50.0,
                        ),
                        DetailView(snapshot: snapshot),
                        const SizedBox(
                          height: 50.0,
                        ),
                        BottomListView(snapshot: snapshot)
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              })
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 0, 140, 255),
    );
  }
}

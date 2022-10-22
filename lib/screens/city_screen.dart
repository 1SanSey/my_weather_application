import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blueAccent,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.blueAccent,
                      size: 50.0,
                    )),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blueAccent)),
              child: const Text(
                'Get Weather',
                style: TextStyle(color: Colors.white, fontSize: 28.0),
              ))
        ],
      ),
    ));
  }
}

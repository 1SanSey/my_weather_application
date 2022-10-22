import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();

        return;
      } else if (permission == LocationPermission.deniedForever) {
        await Geolocator.openLocationSettings();

        return;
      } else {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude;
        longitude = position.longitude;
        // log("latitude = ${position.latitude}");
        // log("longitude= ${position.longitude}");
      }
    } catch (e) {
      log('Something goes wrong: $e');
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'geolocator_services.dart';

class ApplicationBloc with ChangeNotifier{
  final geoLocatorService = GeolocatorService();

  //variables
  Position currentLocation;
  double longitude, latitude;



  ApplicationBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async {

    currentLocation = await geoLocatorService.getCurrentLocation();
    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    notifyListeners();
  }



}
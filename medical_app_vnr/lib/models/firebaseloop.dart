import 'package:firebase_database/firebase_database.dart';

class Need {
  final String State_name;
  final String Latitude;
  final String Longitude;
  final String Facility_Name;

  Need({
    this.State_name,
    this.Latitude,
    this.Longitude,
    this.Facility_Name,
  });
}

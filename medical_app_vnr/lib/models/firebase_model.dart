import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  final double latitude;
  final double longitude;
  HomePage({this.latitude, this.longitude});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  void addData(String data) {
    databaseRef.push().set({'name': data, 'comment': 'A good season'});
  }

  void printFirebase() {
    databaseRef
        .child('991')
        .child("State Name")
        .once()
        .then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  // // void babygo() {
  //   databaseRef
  //       .startAt('155571')
  //       .endAt('155576')
  //       .orderByChild('State Name')
  //       .once()
  //       .then((DataSnapshot snapshot) => print('${snapshot.value}'));
  // }

  void printLocation() {
    print(widget.longitude);
    print(widget.latitude);
  }

  var _currentAddress;
  var _state;
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placeMarks =
      await placemarkFromCoordinates(widget.latitude, widget.longitude);

      Placemark place = placeMarks[0];

      setState(() {
        _currentAddress = "${place.administrativeArea}";
        _state = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getAddressFromLatLng();
    return Scaffold(
      body: Container(
        child: Center(
            child: ElevatedButton(
                child: Text("Click this"),
                onPressed: () {
                  print(_state);
                })),
      ),
    );
  }
}

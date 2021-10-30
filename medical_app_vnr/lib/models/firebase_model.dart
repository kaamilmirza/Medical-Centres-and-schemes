import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final double latitude;
  final double longitude;
  HomePage({this.latitude, this.longitude});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> Telengana =
  FirebaseFirestore.instance.collection("Telengana").snapshots();

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

  Map<int, double> GeoLat = {};
  Map<int, double> GeoLong = {};


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  // var url = 'https://www.google.com/maps/dir/?api=1&origin=43.7967876,-79.5331616&destination=43.5184049,-79.8473993&travelmode=driving&dir_action=navigate';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kButtonColor,
        title: Text("Medical Centers",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            fontSize: 22.0
          )
        ),
      ),
        body: SafeArea(
          child: Container(
            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream: Telengana,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text("Somethign went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading...");
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    scrollDirection: Axis.vertical,
                    itemCount: data.size,
                    itemBuilder: (context, index) {

                      String FacilityName = data.docs[index]["Facility Name"];
                      String Latitude = data.docs[index]['Latitude'];
                      String Longitude = data.docs[index]['Longitude'];
                      String faciltyType = data.docs[index]['Type Of Facility'];
                      GeoLat[index] = double.parse(Latitude);
                      GeoLong[index] = double.parse(Longitude);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: ()
                          {
                            // print(GeoLat[index]);
                            var url = 'https://www.google.com/maps/dir/?api=1&origin=${widget.latitude},${widget.longitude}&destination=${GeoLat[index]},${GeoLong[index]}&travelmode=driving&dir_action=navigate';
                            _launchURL(url);
                      },
                            child: Container(
                              padding: EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      15.0)), // Set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.grey,
                                        offset: Offset(0.0, 3))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$FacilityName",
                                      style: GoogleFonts.poppins(
                                        color: Color(0xff848da0),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SizedBox(
                                    height: 14.0,
                                  ),
                                  Text(
                                    "$faciltyType",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xffabb3c0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Tap to navigate",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xffabb3c0),
                                          fontSize: 8.0,
                                          fontStyle: FontStyle.italic
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}



// Text("The facility name is $FacilityName and lat is $Latitude");
//

// final textController = TextEditingController();
// final databaseRef = FirebaseDatabase.instance.reference();
// final Future<FirebaseApp> _future = Firebase.initializeApp();
// void addData(String data) {
//   databaseRef.push().set({'name': data, 'comment': 'A good season'});
// }
// List data = [];
// Need need = Need();

// void printFirebase() {
//   databaseRef
//       .child('991')
//       .child("Facility Name")
//       .once()
//       .then((DataSnapshot snapshot) {
//     print('Data : ${snapshot.value}');
//   });
// }

// static Future<int> getUserAmount() async {
//   final response = await FirebaseDatabase.instance
//       .reference()
//       .child("Users").orderByChild('State Name')
//       .once();
//   var users = [];
//   response.value.forEach((v) => users.add(v));
//   print(users);
//   return users.length;
// }
// void printFirebase2() {
//   databaseRef
//       .child('155572')
//       .child("State Name")
//       .once()
//       .then((DataSnapshot snapshot) {
//     // print('Data : ${snapshot.value}');
//     data.add(snapshot.value);
//   });
// }

// databaseRef.once("value")
//     .then(function(snapshot) {
//   snapshot.forEach(function(childSnapshot) {
//       // key will be "ada" the first time and "alan" the second time
//       var key = childSnapshot.key;
//       // childData will be the actual contents of the child
//       var childData = childSnapshot.val();
// });
// });
// 155571 - 155581;
// // void babygo() {
//   databaseRef
//       .startAt('155571')
//       .endAt('155576')
//       .orderByChild('State Name')
//       .once()
//       .then((DataSnapshot snapshot) => print('${snapshot.value}'));
// }

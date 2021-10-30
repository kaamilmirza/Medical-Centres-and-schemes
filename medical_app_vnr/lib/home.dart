import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_app/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicine_app/models/firebase_model.dart';
import 'package:medicine_app/services/application_change.dart';
import 'package:provider/provider.dart';
import 'medicalSchemes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

double longitude;
double latitude;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 0, 5),
                      child: Text(
                        "Hello User!",
                        style: GoogleFonts.poppins(textStyle: kBoldTextStyle),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "How are you feeling today?",
                          style: GoogleFonts.poppins(textStyle: kTextStyle),
                        )),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(30),
                        children: [
                          Text(
                            "You are here",
                            style: kBoldTextStyle,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.grey,
                                  offset: Offset(1, 3))
                            ]),
                            height: 300,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              myLocationButtonEnabled: true,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      applicationBloc.currentLocation.latitude,
                                      applicationBloc
                                          .currentLocation.longitude),
                                  zoom: 14),
                            ),
                          ),
                          SizedBox(
                            height: 45.0,
                          ),
                          InkWell(
                            onTap: () {
                              longitude = applicationBloc.longitude;
                              latitude = applicationBloc.latitude;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    latitude: latitude,
                                    longitude: longitude,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15.0)), // Set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey,
                                        offset: Offset(1, 3))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Find Medical Centers",
                                  style: GoogleFonts.poppins(
                                    fontSize:16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Schemes()),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          15.0)), // Set rounded corner radius
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey,
                                        offset: Offset(1, 3))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Schemes",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

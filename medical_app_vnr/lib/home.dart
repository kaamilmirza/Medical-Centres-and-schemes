import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_app/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:medicine_app/models/firebase_model.dart';
import 'package:medicine_app/services/application_change.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
                            height: 15,
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
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
                                longitude = applicationBloc.longitude;
                                print(longitude);
                              },
                              child: Text("Test"))

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

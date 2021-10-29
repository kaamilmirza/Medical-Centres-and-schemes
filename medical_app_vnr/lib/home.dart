import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_app/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Search",
                                suffixIcon: Icon(Icons.search)),
                            onChanged: (value) =>
                                applicationBloc.searchPlaces(value),
                            scrollPadding: EdgeInsets.all(8),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 400,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  myLocationButtonEnabled: true,
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          applicationBloc
                                              .currentLocation.latitude,
                                          applicationBloc
                                              .currentLocation.longitude),
                                      zoom: 14),
                                ),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.6),
                                    backgroundBlendMode: BlendMode.darken),
                              ),
                              Container(
                                height: 200,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        applicationBloc
                                            .searchResults[index].description,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      applicationBloc.searchResults?.length,
                                ),
                              )
                            ],
                          )
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

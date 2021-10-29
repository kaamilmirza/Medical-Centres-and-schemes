import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var longitude;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(body: (applicationBloc.currentLocation) == null)
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
                  "Hey User!!",
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "How are you doing today?",
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.all(30),
                children: [
                  Text(
                    "You are here",
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ))
            ],
          )));
  }
}

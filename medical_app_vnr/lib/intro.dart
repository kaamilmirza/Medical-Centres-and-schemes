import 'package:flutter/material.dart';
import 'package:medicine_app/home.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    child: Image.asset('images/1.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    "Find the nearest Health Centers and government schemes",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: kButtonColor,
                      fontWeight: FontWeight.bold,
                      fontSize:22.0,
                    ),
                  ),
                ),
                InkWell(
                  hoverColor: Colors.white,
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(24.0)), // Set rounded corner radius
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset(1, 3))
                        ]),
                    child: Container(
                      child: Center(
                          child: Text(
                        "Get Started",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: kButtonTextStyle),
                      )),
                    ),
                    height: 80,
                    width: 220,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

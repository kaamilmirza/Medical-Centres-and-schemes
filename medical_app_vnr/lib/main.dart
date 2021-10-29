import 'package:flutter/material.dart';
import 'package:medical_app_vnr/intro.dart';
import 'package:medical_app_vnr/home.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isFirstTimeOpen = false;

  MyAppState(){
  MySharedPreferences.instance
  .getBooleanValue("firstTimeOpen")
      .then((value))=>setState((){
        isFirstTimeOpen = value;
  }));
}

@override
    Widget build(BuildContext context) {
  return ChangeNotifierProvider(
      create: (context) => AppllicationBloc(),
      child: MaterialApp(
          home: isFirstTimeOpen ? Home() : Intro()),
    );
  }
}

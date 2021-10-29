import 'package:flutter/material.dart';
import 'package:medicine_app/services/application_change.dart';
import 'package:provider/provider.dart';
import 'my_shared_preferences.dart';
import 'intro.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';


void main () async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool isFirstTimeOpen = false;

  MyAppState() {
    MySharedPreferences.instance
        .getBooleanValue("firstTimeOpen")
        .then((value) => setState(() {
      isFirstTimeOpen = value;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>ApplicationBloc() ,
      child: MaterialApp(
          home: isFirstTimeOpen ? Home() : Intro()),
    );
  }
}

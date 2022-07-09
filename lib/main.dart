
import 'package:flutter/material.dart';
import 'package:uzcomms/campus_activity/activities.dart';
import 'campus_activity/timetables.dart';
import 'home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uzcomms/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login/register.dart';


Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(Display());
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: Register(),
    );
  }
}













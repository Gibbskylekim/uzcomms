import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uzcomms/login/student.dart';
import 'package:uzcomms/login/teacher.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  @override
  Widget build(BuildContext context) {
    return ControlState();
  }
}

class ControlState extends StatefulWidget {
  const ControlState({Key? key}) : super(key: key);

  @override
  State<ControlState> createState() => _ControlStateState();
}

class _ControlStateState extends State<ControlState> {
  _ControlStateState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var rooll;
  var email;
  var id;
  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance
    .collection("users")//.where('uid', isEqualTo: user!.uid)
    .doc(user!.uid)
    .get()
    .then((value){
      this.loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() => CircularProgressIndicator());
    setState((){
      email = loggedInUser.email.toString();
      rooll = loggedInUser.wrool.toString();
      id = loggedInUser.uid.toString();

    }
    );
  }
  routing(){
    if (rooll == 'Student') {
      return Student(
        id: id,

      );
    }

    else{
      return Teacher(
        id: id,
      );
    }
  }
  @override
  Widget build(BuildContext context){
    CircularProgressIndicator();
    return routing();
  }

}




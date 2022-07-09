import 'package:flutter/material.dart';
class Timetables extends StatefulWidget {
  const Timetables({Key? key}) : super(key: key);

  @override
  State<Timetables> createState() => _TimetablesState();
}

class _TimetablesState extends State<Timetables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timetables',
           style: TextStyle(color: Colors.deepOrangeAccent,
        ),
      ),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.white10,
      body: Text('@Kyle'),
    );
  }
}


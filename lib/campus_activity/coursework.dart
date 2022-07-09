import 'package:flutter/material.dart';
class Coursework extends StatefulWidget {
  const Coursework({Key? key}) : super(key: key);

  @override
  State<Coursework> createState() => _CourseworkState();
}

class _CourseworkState extends State<Coursework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Coursework',
             style: TextStyle(color: Colors.deepOrangeAccent,
        ),
      ),
        backgroundColor: Colors.white10,
      ),

      body: Text('@Kyle'),
    );
  }
}

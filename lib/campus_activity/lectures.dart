import 'package:flutter/material.dart';
class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lectures',
          style: TextStyle(color: Colors.deepOrangeAccent,
          ),
        ),
        backgroundColor: Colors.white10,
      ),
      body: Text('@Kyle'),
    );
  }
}

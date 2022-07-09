import 'package:flutter/material.dart';
class Exams extends StatefulWidget {
  const Exams({Key? key}) : super(key: key);

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Exams',
             style: TextStyle(color: Colors.deepOrangeAccent
        ),
      ),
        backgroundColor: Colors.white10,
      ),

      body: Text('@Kyle'),

    );
  }
}

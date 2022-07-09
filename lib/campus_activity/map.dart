import 'package:flutter/material.dart';
class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Map',
             style: TextStyle(color: Colors.deepOrangeAccent
        ),
      ),
        backgroundColor: Colors.white10,
      ),
      body: Text('@Kyle'),

    );
  }
}

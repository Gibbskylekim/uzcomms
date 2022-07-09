import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Notifications',
             style: TextStyle(color: Colors.deepOrangeAccent,
        ),
      ),
        backgroundColor: Colors.white10,
      ),
      body: Text('@Kyle'),
    );
  }
}

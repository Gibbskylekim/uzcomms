
import 'package:flutter/material.dart';
import 'coursework.dart';
import 'exams.dart';
import 'notifications.dart';
import 'map.dart';
import 'lectures/lectures.dart';
import 'timetables.dart';

class CampusActivity extends StatefulWidget {
  const CampusActivity({Key? key}) : super(key: key);

  @override
  State<CampusActivity> createState() => _CampusActivityState();
}

class _CampusActivityState extends State<CampusActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Activities',
          style: TextStyle(color: Colors.deepOrangeAccent,
        ),

      ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },),
        backgroundColor: Colors.indigo,
    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: .0),
            ),

            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.2),
                    ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const Timetables())
                          );
                         },
                        child: const Text('Timetables',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),

            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Lectures())
                      );
                    },
                      child: const Text('Lectures',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Notifications())
                      );
                    },
                      child: const Text('Notifications',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Map())
                      );
                    },
                      child: const Text('Map',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Exams())
                      );
                    },
                      child: const Text('Exams',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/flower.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Coursework())
                      );
                    },
                      child: const Text('Coursework',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(

                    ),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 5,),
         ],
      ),
    ),
    );
  }
}



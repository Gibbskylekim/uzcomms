

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uzcomms/campus_activity/activities.dart';
import 'package:uzcomms/sidebar/sidebar.dart';

import '../campus_activity/timetables.dart';
import '../login/login.dart';

/*class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('UZCOMMS',
          style: TextStyle(color: Colors.deepOrangeAccent,

          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.vpn_key_outlined,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('Sign In'),
                      ),
                    ],),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.message,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('Messages'),
                      ),
                    ],),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.settings,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('Settings'),
                      ),
                    ],),
                ),
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.settings,
                        color: Colors.black,

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text('Select User'),
                      ),
                    ],),
                ),
              ],
              child: const Icon(
                Icons.person,
                size: 28.0,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: const LoginScreen(),

    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //textController
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  final _formkey = GlobalKey<FormState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Timetables(),)
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found');
        }
        else if (e.code == 'wrong-password') {
          print('Wrong password');
        }
      }
    }
  }
    @override
    void dispose() {
      _passwordController.dispose();
      _emailController.dispose();
      super.dispose();
    }


    bool _secureText = true;
    @override
    Widget build(BuildContext context) {
      navigatorKey:
      navigatorKey;
      _formkey:
      _formkey;
      bool visible = false;
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.70,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 88,),

                const SizedBox(
                  child: Text('UZCOMMS',
                    style: TextStyle(color: Colors.deepOrange,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Text('login',
                    style: TextStyle(color: Colors.deepOrangeAccent,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34.0,

                ),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'User email',
                    labelText: 'email',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,

                    ),
                    border: OutlineInputBorder(

                    ),
                    //prefixIcon: Icon(Icons.mail, color: Colors.indigo,)
                  ),
                  validator: (value) {
                    if (value!.length == 0) {
                      return 'Email cannot be empty';
                    }
                    if (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[A-Z]")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _emailController.text = value!;
                  },

                ),

                const SizedBox(
                  height: 26.0,

                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _secureText,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'User Password',
                    labelText: 'password',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,

                    ),
                    border: const OutlineInputBorder(

                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _secureText ? Icons.security : Icons.remove_red_eye,
                      ),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                    //prefixIcon: Icon(Icons.lock, color: Colors.indigo,)
                  ),
                  validator: (value) {
                    RegExp regex = new RegExp(r"^.{6,}$");
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                      return ("enter valid password");
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _passwordController.text = value!;
                  },
                ),

                const SizedBox(height: 26.0),


                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0))
                  ),
                  elevation: 2.0,
                  height: 40,
                  onPressed: () {
                    setState(() {
                      visible = true;
                    }
                    );
                    signIn(_emailController.text, _passwordController.text);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,

                    ),
                  ),
                  color: Colors.white,

                ),
                SizedBox(height: 10),
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visible,
                    child: Container(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )),

                const SizedBox(height: 40.0,),
                const SizedBox(
                  child: Text("Forgot your Password?",
                      style: TextStyle(
                        color: Colors.red,
                      )
                  ),
                ),

              ],

            ),
          ),
        ),
      );
    }
  }
*/



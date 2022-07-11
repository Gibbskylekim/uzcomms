

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uzcomms/login/model.dart';
import 'dart:io';
import 'hom.dart';
import 'login.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();
  bool showProgress = false;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Teacher',
  ];
  var _currentItemSelected = "Student";
  var rool ="Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('UZCOMMS',
          style: TextStyle(color: Colors.orange[900],
          ),
        ),
        actions: [
          DropdownButton<String>(
            dropdownColor: Colors.blue[900],
            isDense: true,
            isExpanded: false,
            iconEnabledColor: Colors.deepOrangeAccent,
            focusColor: Colors.deepOrangeAccent,
            items: options.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: const TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),
                  ));}).toList(),
            onChanged: (newValueSelected){
              setState((){
                _currentItemSelected = newValueSelected!;
                rool = newValueSelected;});

            },
            value: _currentItemSelected,
          ),
        ],
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(14.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 110,),
                        const Text("Register ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,

                          ),
                        ),
                        const SizedBox(height: 30,),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            labelText: 'User Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                              left: 14.0,
                              bottom: 8.0,
                              top: 8.0,

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return 'Email cannot be empty';
                            }
                            // if (!RegExp(
                            //     "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[A-Z]")
                            //     .hasMatch(value)) {
                            //   return 'Please enter a valid email';
                            // }
                            else {
                              return null;
                            }
                          },
                          onChanged: (value){

                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20,),

                    TextFormField(
                      obscureText: _isObscure,
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                          ? Icons.visibility_off
                              :Icons.visibility,

                          ),
                          onPressed: (){
                            setState((){
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        labelText: 'User Password',
                        enabled: true,
                        contentPadding: const EdgeInsets.only(
                          left: 14.0,
                          bottom: 8.0,
                          top: 8.0,

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        RegExp regex = RegExp(r"^.{6,}$");
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
                      onChanged: (value){},
                    ),
                    const SizedBox(height: 20,),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: confirmController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  :Icons.visibility,

                              ),
                              onPressed: (){
                                setState((){
                                  _isObscure2 = !_isObscure2;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                              left: 14.0,
                              bottom: 8.0,
                              top: 8.0,

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if(confirmController.text != passwordController.text)
                              {
                                return "Password did not match";
                            }
                            else {
                              return null;
                            }
                          },
                          onChanged: (value){},
                        ),
                        const SizedBox(height: 20,),

                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                                elevation: 5.0,
                                height: 40,
                                onPressed: (){
                                const CircularProgressIndicator();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                                },
                              child: const Text('Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              color: Colors.indigo[900],
                        ),
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () async {
                                setState((){
                                  showProgress = true;
                                }
                                );
                                await signUp(emailController.text, passwordController.text, rool);
                              },
                              child: const Text('Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              color: Colors.indigo[900],
                            ),
                      ],
                    ),
                     const SizedBox(height: 10.0,),

                    ],
                  ),
                ),
              ),
            )

            ), ],
        ),
      ),
    );
  }
  Future<void> signUp(String email, String password, String rool) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()){
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => { postDetailsToFirestore(email, rool)})
          .catchError((e){});
    }
  }
  postDetailsToFirestore(String email, rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = email;
    userModel.uid = user!.uid;
    userModel.wrool = rool;
    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
       .set(userModel.toMap());
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const HomePage())
        );


  }
}



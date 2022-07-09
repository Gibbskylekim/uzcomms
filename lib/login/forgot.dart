
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  _ForgotPassState();
  //bool showProgress = false;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  color: Colors.blue[900],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 80,),
                              Text("Forgot\n" "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,

                                ),
                              ),
                              SizedBox(height: 40,),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Email',
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                    left: 14.0,
                                    bottom: 8.0,
                                    top: 8.0,

                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(20),

                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.white),
                                    borderRadius: new BorderRadius.circular(20),
                                  ),
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
                                onSaved: (value){

                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    elevation: 5.0,
                                    height: 40,
                                    onPressed: (){
                                      CircularProgressIndicator();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Text('Login',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    elevation: 5.0,
                                    height: 40,
                                    onPressed: (){
                                      forgotPass(emailController.text);
                                      setState(() {
                                        visible = true;
                                      });
                                    },
                                    child: Text('Ok',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    color: Colors.white,
                              ),
                    ],
                  ),
                              SizedBox(height: 10.0,),

                            ],),
                        ),
                      ),
                    ),
                  )

              ), ],
          ),
        ),
      ),
    );
  }
  void forgotPass(String email) async {
  if (_formkey.currentState!.validate()){
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage())).catchError((e){}));
  }

  }
}



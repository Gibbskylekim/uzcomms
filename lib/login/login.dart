import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uzcomms/login/forgot.dart';
import 'package:uzcomms/login/register.dart';
import 'hom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[900],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.orangeAccent[700],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.70,
                child: SingleChildScrollView(
                  child: Column(

                    children: <Widget> [
                      Container(
                        margin: EdgeInsets.all(12.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30,),
                              Text("Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,

                                ),
                              ),
                              SizedBox(height: 20,),
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
                                  emailController.text = value!;

                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 20,),

                              TextFormField(
                                obscureText: _isObscure3,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure3
                                        ? Icons.visibility
                                        :Icons.visibility_off,

                                    ),
                                    onPressed: (){
                                      setState((){
                                        _isObscure3 = !_isObscure3;
                                      });
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
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
                                onSaved: (value){
                                  passwordController.text = value!;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              RaisedButton(
                                color: Colors.orange[900],
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(

                                  ),
                                  onPressed: (){
                                     Navigator.of(context).pushReplacement(MaterialPageRoute(
                                         builder: (context) => ForgotPass(),)
                                     );
                                  },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                elevation: 5.0,
                                height: 40,
                                onPressed: (){
                                  setState((){
                                    visible = true;
                                  }
                                  );
                                  signIn(emailController.text, passwordController.text);

                                },
                                child: Text('Login',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                              SizedBox(height: 10.0,),
                              Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: visible,
                                  child: Container(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),),
                             Container(
                               color: Colors.white,
                               width: MediaQuery.of(context).size.width,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   SizedBox(height: 20,),
                                   MaterialButton(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                     ),
                                     elevation: 5.0,
                                     height: 40,
                                     onPressed: (){
                                       Navigator.pushReplacement(context, MaterialPageRoute(
                                           builder: (context) => Register()),);
                                     },
                                     child: Text('Register',
                                       style: TextStyle(
                                         fontSize: 20.0,
                                       ),
                                     ),
                                     color: Colors.white,
                                   ),
                                 ],
                               ),

                             ),
                              SizedBox(height: 20,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )

            ), ],
        ),
      ),
    );

  }
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()){
      try{
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()),
        );
      }on FirebaseAuthException catch (e){
        if (e.code == 'user-not-found'){
          print('No user found for that email');
        }
        else if (e.code == 'wrong-password'){
          print('Wrong password provided for that user');
        }
      }
    }

  }
}


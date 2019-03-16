import 'package:firebase_auth/firebase_auth.dart';
import 'package:trufit/Screens/Authentication/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Longer than 6 characters';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
  
  void signUp() async {
      if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        // user.sendEmailVerification();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
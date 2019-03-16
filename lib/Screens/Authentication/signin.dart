import 'package:trufit/Screens/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password; // _ is used to mark variables private.
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter email.';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Please provide a password having more than 6 characters atleast.';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState =_formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user =await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(user : user)));
      } catch(e) {
        print(e.message);
      }
    }
  }
}
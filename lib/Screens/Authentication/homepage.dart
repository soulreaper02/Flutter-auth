import 'package:trufit/Screens/Authentication/signin.dart';
import 'package:trufit/Screens/Authentication/signup.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Trufit'),
      ),body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign In'),
            ),
            RaisedButton(
              onPressed: navigateToSignUp,
              child: Text('Sign Up'),
              ),
        ],
      ),
    );
  }

  void navigateToSignIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(), fullscreenDialog: true));
  }

}
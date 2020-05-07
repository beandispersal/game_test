import 'package:flutter/material.dart';
import 'package:lwk/AuthTrial.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null){
                print('error');
              }else{
                print(result.uid);
              }
          },
            child: Text('Log In Anonymously'),),
        ),
      )
    );
  }
}

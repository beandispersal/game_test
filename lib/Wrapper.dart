import 'package:flutter/material.dart';
import 'package:lwk/Game/Start.dart';
import 'package:lwk/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user == null){
      return SignIn();
    }else{
      return Start();
    }
  }
}
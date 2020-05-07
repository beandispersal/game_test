import 'package:flutter/material.dart';
import 'package:lwk/Auth_service.dart';
import 'package:lwk/Game/Start.dart';
import 'package:lwk/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryTextTheme: TextTheme(title: TextStyle(fontSize: 40)),
          //dialogTheme: DialogTheme(contentTextStyle: TextStyle(fontSize: 20)),
          fontFamily: 'tStyle',
          textTheme: TextTheme(
            title: TextStyle(fontSize: 40),
            subhead: TextStyle(fontSize: 30),
            body1: TextStyle(fontSize: 35),
            button: TextStyle(fontSize: 30),
          ),
          buttonTheme: ButtonThemeData(buttonColor: Colors.pink[300]),
        ),
        //home: Wrapper(),
        routes: {
          '/': (context) => Wrapper(),
          'start': (context) => Start(),
        },
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}

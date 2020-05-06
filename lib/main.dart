import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lwk/CityCentre.dart';
import 'package:lwk/Kitchen.dart';
import 'package:lwk/Kitchen2.dart';
import 'package:lwk/Kitchen3.dart';
import 'package:lwk/Restaurants.dart';
import 'package:lwk/Storage.dart';
import 'package:lwk/Telephone.dart';
import 'package:lwk/Garden.dart';
import 'package:lwk/Garden2.dart';
import 'package:lwk/Garden3.dart';
import 'package:lwk/Bedroom.dart';
import 'package:lwk/Outside.dart';
import 'package:lwk/Community.dart';
import 'package:lwk/Grocery.dart';
import 'package:lwk/Park.dart';
import 'package:lwk/Mall.dart';





void main() => runApp(MaterialApp(
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
//  home: Start(),
  initialRoute: '/',
  routes: {
    '/': (context) => Start(),
//    '/kitchen': (context) => Kitchen(),
//    '/kitchen2': (context) => Kitchen2(),
//    '/kitchen3': (context) => Kitchen3(),
//    '/storage': (context) => Storage(),
//    '/telephone': (context) => Telephone(),
//    '/garden': (context) => Garden(),
//    '/garden2': (context) => Garden2(),
//    '/garden3': (context) => Garden3(),
//    '/bedroom': (context) => Bedroom(),
//    '/outside': (context) => Outside(),
//    '/community': (context) => Community(),
//    '/grocery': (context) => Grocery(),
//    '/park': (context) => Park(),
//    '/mall': (context) => Mall(),
//    '/cityCentre': (context) => CityCentre(),
//    '/restaurants': (context) => Restaurants(),
  },
)
);

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Welcome!',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Kitchen'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Storage()));
              },
              child: Text('Storage'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Telephone()));
              },
              child: Text('Telephone'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, ScaleRoute(page: Garden()));
              },
              child: Text('Garden'),
            ),
            RaisedButton(
              onPressed: () async {
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('I\'m glad you are well-rested.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
                Navigator.push(context, ScaleRoute(page: Bedroom()));
              },
              child: Text('Sleep'),
            ),
          ],
        ),
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

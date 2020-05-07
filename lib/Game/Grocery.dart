import 'package:flutter/material.dart';
import 'package:lwk/Game/Bedroom.dart';
import 'package:lwk/Game/CityCentre.dart';
import 'package:lwk/Game/Community.dart';
import 'package:lwk/Game/Park.dart';
import 'package:lwk/main.dart';

class Grocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Grocery',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Community()));
              },
              child: Text('Community'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Bedroom()));
              },
              child: Text('Home'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Park()));
              },
              child: Text('Park'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: CityCentre()));
              },
              child: Text('City Centre'),
            ),
          ],
        ),
      ),
    );
  }
}

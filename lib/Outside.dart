import 'package:flutter/material.dart';
import 'package:lwk/Bedroom.dart';
import 'package:lwk/Community.dart';
import 'package:lwk/Grocery.dart';
import 'package:lwk/Park.dart';
import 'package:lwk/main.dart';

class Outside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Outside',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            Container(
              child: Column(
                children: <Widget>[
                  Text('Don\'t forget to wear mask.'),
                  Text('Practice social distancing.'),
                ],
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[300],
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
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
                Navigator.pushReplacement(context, ScaleRoute(page: Grocery()));
              },
              child: Text('Grocery'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Park()));
              },
              child: Text('Park'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Bedroom()));
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
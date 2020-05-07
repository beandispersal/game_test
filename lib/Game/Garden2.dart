import 'package:flutter/material.dart';
import 'package:lwk/Game/Garden3.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/main.dart';
class Garden2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text('Garden',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            Container(
              child: Text('Harvested!'),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            SizedBox(height: 100),
            Text('What do you wanna do?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Storage()));
              },
              child: Text('Store it'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Garden3()));
              },
              child: Text('Sell it'),
            ),
          ],
        ),
      ),
    );
  }
}

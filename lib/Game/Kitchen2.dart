import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/main.dart';
class Kitchen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Kitchen',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            Container(
              child: Text('Your beans have grown in volume.'),
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
                Navigator.pushReplacement(context, ScaleRoute(page: Garden()));
              },
              child: Text('Plant beans sprout'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Storage()));
              },
              child: Text('Store beans'),
            ),
          ],
        ),
      ),
    );
  }
}

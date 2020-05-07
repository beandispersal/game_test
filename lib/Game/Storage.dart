import 'package:flutter/material.dart';
import 'package:lwk/Game/Bedroom.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Outside.dart';
import 'package:lwk/Game/Telephone.dart';
import 'package:lwk/main.dart';
class Storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Storage',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Garden()));
              },
              child: Text('Get some seeds to plant'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Get some food to cook'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Telephone()));
              },
              child: Text('Telephone'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Outside()));
              },
              child: Text('Outside'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Bedroom()));
              },
              child: Text('Bedroom'),
            ),
          ],
        ),
      ),
    );
  }
}

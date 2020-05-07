import 'package:flutter/material.dart';
import 'package:lwk/Game/Bedroom.dart';
import 'package:lwk/Game/CityCentre.dart';
import 'package:lwk/Game/Grocery.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Mall.dart';
import 'package:lwk/main.dart';

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Restaurants',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('What do you wanna do?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Mall()));
              },
              child: Text('Go Shopping'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Grocery()));
              },
              child: Text('Buy grocery'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: CityCentre()));
              },
              child: Text('Go to the city'),
            ),
            RaisedButton(
              onPressed: () async {
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Instead of eating outside, bring it to your house. It\'s safe that way.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Take away food'),
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

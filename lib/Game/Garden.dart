import 'package:flutter/material.dart';
import 'package:lwk/Game/Garden2.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Outside.dart';
import 'package:lwk/main.dart';

class Garden extends StatelessWidget {
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
            SizedBox(height: 100),
            Text('What do you wanna do?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You are prepared for the future.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
              },
              child: Text('Plant some seeds'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Garden2()));
              },
              child: Text('Harvest'),
            ),
            RaisedButton(
              onPressed: (){
                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('Your plants have grown.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
              },
              child: Text('Water the plants'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Go to Kitchen'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Outside()));
              },
              child: Text('Go outside'),
            ),
          ],
        ),
      ),
    );
  }
}

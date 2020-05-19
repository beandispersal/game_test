  import 'package:flutter/material.dart';
import 'package:lwk/Bedroom.dart';
import 'package:lwk/Garden.dart';
import 'package:lwk/Outside.dart';
import 'package:lwk/main.dart';
class Telephone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text('Telephone',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('You are smart. Don\'t go outside, call them instead.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
              },
              child: Text('Call community centre'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Bedroom()));
              },
              child: Text('Bedroom'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Garden()));
              },
              child: Text('Garden'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Outside()));
              },
              child: Text('Outside'),
            ),
          ],
        ),
      ),
    );
  }
}



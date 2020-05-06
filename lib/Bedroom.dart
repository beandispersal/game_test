import 'package:flutter/material.dart';
import 'package:lwk/Garden.dart';
import 'package:lwk/Kitchen.dart';
import 'package:lwk/Storage.dart';
import 'package:lwk/Telephone.dart';
import 'package:lwk/main.dart';

class Bedroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Bedroom',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Kitchen'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Storage()));
              },
              child: Text('Storage'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Telephone()));
              },
              child: Text('Telephone'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Garden()));
              },
              child: Text('Garden'),
            ),
            RaisedButton(
              onPressed: (){
                showDialog<void>(
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
              },
              child: Text('Sleep'),
            ),
          ],
        ),
      ),
    );
  }
}

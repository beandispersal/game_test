import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwk/Bedroom.dart';
import 'package:lwk/Garden.dart';
import 'package:lwk/Kitchen2.dart';
import 'package:lwk/Kitchen3.dart';
import 'package:lwk/Outside.dart';
import 'package:lwk/Storage.dart';
import 'package:lwk/main.dart';
class Kitchen extends StatelessWidget {
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
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen2()));
              },
              child: Text('Soak beans'),
            ),
            RaisedButton(
              onPressed: ()async{
                await showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Good work of food preservation!'),
                        content: Text('You can keep your food supply longer.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
                Navigator.pushReplacement(context, ScaleRoute(page: Storage()));
              },
              child: Text('Reduce meal portions'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen3()));
              },
              child: Text('Cook'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(context, ScaleRoute(page: Storage()));
              },
              child: Text('Storage'),
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

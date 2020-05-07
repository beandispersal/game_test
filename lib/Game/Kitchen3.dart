import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Game/Kitchen.dart';

class Kitchen3 extends StatelessWidget {
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
              child: Text('Alright! Let\'s cook!'),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[300],
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            SizedBox(height: 100),
            Text('Which would you like to cook?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () async{
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Very Good! You prolonged your food.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Porridge'),
            ),
            RaisedButton(
              onPressed: ()async{
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Your rice has been cooked, enjoy your meal.'),
                        actions: <Widget>[FlatButton(
                          onPressed: (){Navigator.of(context).pop();},
                          child: Text('Ok'),
                        )],
                      );
                    }
                );
                Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
              },
              child: Text('Rice'),
            ),
          ],
        ),
      ),
    );
  }
}

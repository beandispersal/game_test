import 'package:flutter/material.dart';

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
                Navigator.popAndPushNamed(context, '/mall');
              },
              child: Text('Go Shopping'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/grocery');
              },
              child: Text('Buy grocery'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/cityCentre');
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
                Navigator.popAndPushNamed(context, '/kitchen');
              },
              child: Text('Take away food'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/bedroom');
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}

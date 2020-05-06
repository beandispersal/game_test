import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Mall',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () async {
                await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Game Over!'),
                        content: Text('Your life is more important than Bubble Tea, yeah?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: (){
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                            },
                            child: Text('Try Again'),
                          ),
                          FlatButton(
                            onPressed: (){
                              SystemNavigator.pop();
                            },
                            child: Text('Exit'),
                          ),
                        ],
                      );
                    }
                );
              },
              child: Text('Bubble Tea Station'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/restaurants');
              },
              child: Text('Restaurants'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/bedroom');
              },
              child: Text('Gym'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/bedroom');
              },
              child: Text('Office'),
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

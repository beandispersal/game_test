import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Community',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
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
                        content: Text('The Community Captain is infected. Next time please call!'),
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
              child: Text('Community Hall'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/bedroom');
              },
              child: Text('Home'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/grocery');
              },
              child: Text('Grocery'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/park');
              },
              child: Text('Park'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/cityCentre');
              },
              child: Text('City Centre'),
            ),
          ],
        ),
      ),
    );
  }
}

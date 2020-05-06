import 'package:flutter/material.dart';

class Park extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Park',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/community');
              },
              child: Text('Community'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/grocery');
              },
              child: Text('Grocery'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/cityCentre');
              },
              child: Text('City Centre'),
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

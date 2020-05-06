import 'package:flutter/material.dart';

class Storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('Storage',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
            SizedBox(height: 100),
            Text('Where do you wanna go?'),
            SizedBox(height: 40),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/garden');
              },
              child: Text('Get some seeds to plant'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/kitchen');
              },
              child: Text('Get some food to cook'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/telephone');
              },
              child: Text('Telephone'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/outside');
              },
              child: Text('Outside'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/bedroom');
              },
              child: Text('Bedroom'),
            ),
          ],
        ),
      ),
    );
  }
}

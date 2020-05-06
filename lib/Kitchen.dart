import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Navigator.popAndPushNamed(context, '/kitchen2');
              },
              child: Text('Soak beans'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/storage');
              },
              child: Text('Reduce meal portions'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/kitchen3');
              },
              child: Text('Cook'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/storage');
              },
              child: Text('Storage'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.popAndPushNamed(context, '/garden');
              },
              child: Text('Garden'),
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

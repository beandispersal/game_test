import 'package:flutter/material.dart';
import 'package:lwk/Auth_service.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/Game/Telephone.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Bedroom.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('The COVID-19 Survival Guide'),
          actions: <Widget>[
            FlatButton.icon(onPressed: ()async{await _auth.signOut();}, icon: Icon(Icons.person), label: Text('Logout'))
          ],
      ),
      body: Stack(
          children: <Widget>[
//          Container(
//            decoration: BoxDecoration(image: DecorationImage(image: Image'imageBckg.jpg',fit: BoxFit.cover)),
//          ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Text('Welcome!',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
                  SizedBox(height: 100),
                  Text('Where do you wanna go?'),
                  SizedBox(height: 40),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: Kitchen()));
                    },
                    child: Text('Kitchen'),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: Storage()));
                    },
                    child: Text('Storage'),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: Telephone()));
                    },
                    child: Text('Telephone'),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: Garden()));
                    },
                    child: Text('Garden'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      await showDialog<void>(
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
                      Navigator.push(context, ScaleRoute(page: Bedroom()));
                    },
                    child: Text('Sleep'),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}

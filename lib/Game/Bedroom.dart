import 'package:flutter/material.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/Game/Telephone.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Database_service.dart';
import 'package:lwk/UserData.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lwk/Game/GameOver.dart';

class Bedroom extends StatefulWidget {
  @override
  _BedroomState createState() => _BedroomState();
}

class _BedroomState extends State<Bedroom> {
  bool isGameOver = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          return isGameOver ? GameOver() : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,8,0),
                  child: Align(

                    alignment: Alignment.topRight,
                    child: Container(
                      constraints: BoxConstraints.tightFor(width: 100),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                            Radius.circular(20.0)
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.favorite, color: Colors.pink),
                              Text(userData.hunger.toString(),style: TextStyle(fontSize: 25)),
                              Icon(Icons.add, color: Colors.white)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.attach_money, color: Colors.green[900]),
                              Text(userData.money.toString(),style: TextStyle(fontSize: 25)),
                              Icon(Icons.add, color: Colors.white)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('Bedroom', style: TextStyle(
                    fontSize: 50, decoration: TextDecoration.underline),),

                Text('Where do you wanna go?'),
                SizedBox(height: 40),
                RaisedButton(
                  onPressed: () {
                    userData.zhistory.add('Kitchen');
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    if (!isGameOver) {
                      Navigator.pushReplacement(
                          context, ScaleRoute(page: Kitchen()));
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/kitchen.png')))
                        ,
                        Text('Kitchen'),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    userData.zhistory.add('Storage');
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    if (!isGameOver) {
                      Navigator.pushReplacement(
                          context, ScaleRoute(page: Storage()));
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/storage.png')))
                        ,
                        Text('Storage'),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    userData.zhistory.add('Telephone');
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    setState(() {
                      isGameOver = Check().checkHunger(userData.hunger);
                    });
                    if (!isGameOver) {
                      Navigator.pushReplacement(
                          context, ScaleRoute(page: Telephone()));
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/telephone.png')))
                        ,
                        Text('Telephone'),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    userData.zhistory.add('Garden');
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    setState(() {
                      isGameOver = Check().checkHunger(userData.hunger);
                    });
                    if (!isGameOver) {
                      Navigator.pushReplacement(
                          context, ScaleRoute(page: Garden()));
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/garden.png')))
                        ,
                        Text('Garden'),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    setState(() {
                      isGameOver = Check().checkHunger(userData.hunger);
                    });
                    if (!isGameOver) {
                      showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('I\'m glad you are well-rested.'),
                              actions: <Widget>[FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'),
                              )
                              ],
                            );
                          }
                      );
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/sleep.png')))
                        ,
                        Text('Sleep'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.call),
      ),
    );
  }
}

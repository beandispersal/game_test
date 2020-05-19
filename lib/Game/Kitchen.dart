import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwk/Game/Bedroom.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Kitchen2.dart';
import 'package:lwk/Game/Kitchen3.dart';
import 'package:lwk/Game/Outside.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Database_service.dart';
import 'package:lwk/UserData.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lwk/Game/GameOver.dart';


class Kitchen extends StatefulWidget {
  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
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
              Text('Kitchen', style: TextStyle(
                  fontSize: 50, decoration: TextDecoration.underline),),

              Text('Where do you wanna go?'),
              SizedBox(height: 40),
              SingleChildScrollView(
                child: Column(children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                      setState(() {
                        isGameOver = Check().checkHunger(userData.hunger);
                      });
                      if (!isGameOver) {
                        Navigator.pushReplacement(
                            context, ScaleRoute(page: Kitchen2()));
                      }
                    },
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(width: 300),
                      child: Row(
                        children: <Widget>[
                          Container(
                              constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              child: Image(image: AssetImage('assets/soakbeans.png')))
                          ,
                          Text('Soak beans'),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Good work of food preservation!'),
                              content: Text(
                                  'You can keep your food supply longer.'),
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
                      DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                      setState(() {
                        isGameOver = Check().checkHunger(userData.hunger);
                      });
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
                              child: Image(image: AssetImage('assets/reducemealportions.png')))
                          ,
                          Text('Reduce Meal Portion'),
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
                        Navigator.pushReplacement(context, ScaleRoute(page: Kitchen3()));
                      }
                    },
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(width: 300),
                      child: Row(
                        children: <Widget>[
                          Container(
                              constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              child: Image(image: AssetImage('assets/cook.png')))
                          ,
                          Text('Cook'),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      userData.zhistory.add('Storage');
                      DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                      setState(() {
                        isGameOver = Check().checkHunger(userData.hunger);
                      });
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
                      userData.zhistory.add('Outside');
                      DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                      setState(() {
                        isGameOver = Check().checkHunger(userData.hunger);
                      });
                      if (!isGameOver) {
                        Navigator.pushReplacement(
                            context, ScaleRoute(page: Outside()));
                      }
                    },
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(width: 300),
                      child: Row(
                        children: <Widget>[
                          Container(
                              constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                              child: Image(image: AssetImage('assets/outside.png')))
                          ,
                          Text('Outside'),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      userData.zhistory.add('Bedroom');
                      DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                      setState(() {
                        isGameOver = Check().checkHunger(userData.hunger);
                      });
                      if (!isGameOver) {
                        Navigator.pushReplacement(
                            context, ScaleRoute(page: Bedroom()));
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
                          Text('Bedroom'),
                        ],
                      ),
                    ),
                  ),
                ],),
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

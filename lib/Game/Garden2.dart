import 'package:flutter/material.dart';
import 'package:lwk/Game/Garden3.dart';
import 'package:lwk/Game/Storage.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Database_service.dart';
import 'package:lwk/UserData.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lwk/Game/GameOver.dart';

class Garden2 extends StatelessWidget {
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
                Text('Garden',style: TextStyle(fontSize: 50,decoration: TextDecoration.underline),),
                Container(
                  child: Text('Harvested!'),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),

                Text('What do you wanna do?'),
                SizedBox(height: 40),
                RaisedButton(
                  onPressed: (){
                    userData.zhistory.add('Storage');
                    DatabaseService(uid: user.uid).updateUserData(userData.money, userData.hunger - 1, userData.zhistory, userData.zbest, userData.username);
                    if (!isGameOver) {
                      Navigator.pushReplacement(context, ScaleRoute(
                          page: Storage()));
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
                        Text('Store it'),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    double newM = userData.money + 5;
                    DatabaseService(uid: user.uid).updateUserData(newM, userData.hunger-1, userData.zhistory, userData.zbest, userData.username);
                    if (!isGameOver) {
                      Navigator.pushReplacement(context, ScaleRoute(page: Garden3()));
                    }
                  },
                  child: Container(
                    constraints: BoxConstraints.tightForFinite(width: 300),
                    child: Row(
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints(maxHeight: 60, minHeight: 60),
                            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                            child: Image(image: AssetImage('assets/sellit.png')))
                        ,
                        Text('Sell it'),
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

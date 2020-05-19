import 'package:flutter/material.dart';
import 'package:lwk/Game/Bedroom.dart';
import 'package:lwk/Game/Garden.dart';
import 'package:lwk/Game/Kitchen.dart';
import 'package:lwk/Game/Outside.dart';
import 'package:lwk/Game/Telephone.dart';
import 'package:lwk/main.dart';
import 'package:lwk/Database_service.dart';
import 'package:lwk/UserData.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lwk/Game/GameOver.dart';

class Storage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
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
          return isGameOver ? GameOver() : Stack(
              children: <Widget>[
                Container(
                  width: 800,
                  height: 400,
                  child: Image(
                      fit:BoxFit.cover,
                      // height: double.infinity ,
                      // width: double.infinity,
                      image: AssetImage('assets/background.png')
                  ),
                ),
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
                Positioned(
                  child:
                  Text('Storage',style: TextStyle
                    (color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,

                  ),),
                  top: 20,
                  left: 270,
                ),
                //  SizedBox(height: 30,),
                // SizedBox(height: 100),
                Positioned(
                  child:
                  Text('Where do you wanna go?',
                    style:  TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  top: 70,
                  left: 200,
                ),
                // SizedBox(height: 40),

                Positioned(
                  top: 110,
                  left: 100,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, ScaleRoute(page: Telephone()));
                          },
                          child: Container(
                            constraints: BoxConstraints.tightForFinite(
                                width: 180
                            ),
                            child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 30,
                                    margin:EdgeInsets.fromLTRB(0, 0,10,0),
                                    child:
                                    Image(
                                        image:AssetImage('assets/telephone.png')
                                    ),
                                  ),
                                  Text('Telephone'),

                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 160,
                  left: 100,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
                    },
                    child:Container(
                      constraints: BoxConstraints.tightForFinite(
                          width: 180
                      ),
                      child:Row(
                        children: <Widget>[
                          Container(
                            width:30,
                            height:30,
                            margin:EdgeInsets.fromLTRB(0, 0,10,0),
                            child: Image(
                              image: AssetImage('assets/cooking.png'),
                            ),
                          ),
                          Text('Cook some food!'),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 210,
                  left: 100,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, ScaleRoute(page: Outside()));
                    },
                    child:
                    Container(
                      constraints: BoxConstraints.tightForFinite(
                          width: 180
                      ),
                      child: Row(

                        children: <Widget>[
                          Container(
                            width:30,
                            height:30,
                            margin:EdgeInsets.fromLTRB(0, 0,10,0),
                            child: Image(
                              image: AssetImage('assets/park.png'),
                            ),
                          ),
                          Text('Outside'),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 110,
                  left: 330,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, ScaleRoute(page: Bedroom()));
                    },
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(
                          width: 180
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:30,
                            height:30,
                            margin:EdgeInsets.fromLTRB(0, 0,10,0),
                            child: Image(
                              image: AssetImage('assets/bedroom.png'),

                            ),
                          ),

                          Text('Bedroom'),

                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 160,
                  left: 330,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, ScaleRoute(page: Garden()));
                    },
                    child: Container(
                      constraints: BoxConstraints.tightForFinite(
                          width: 180
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width:30,
                            height:30,
                            margin:EdgeInsets.fromLTRB(0, 0,10,0),
                            child: Image(
                              image: AssetImage('assets/garden.png'),
                            ),
                          ),
                          Text('Garden'),



                        ],
                      ),
                    ),
                  ),
                ),
              ],
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

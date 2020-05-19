import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwk/Bedroom.dart';
import 'package:lwk/Garden.dart';
import 'package:lwk/Kitchen.dart';
import 'package:lwk/Outside.dart';
import 'package:lwk/Telephone.dart';
import 'package:lwk/main.dart';
class Storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The COVID-19 Survival Guide')),
      body: Stack(
        children: <Widget> [

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
          ),
        );






  }
}


//RaisedButton(
//onPressed: (){
//Navigator.pushReplacement(context, ScaleRoute(page: Kitchen()));
//},
//child:Stack(
//children: <Widget> [
//Text('Get some food to cook'),
//],
//),
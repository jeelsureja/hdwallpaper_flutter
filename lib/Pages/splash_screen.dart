import 'dart:async';


import 'package:flutter/material.dart';
import 'package:hdwallpaper/Pages/home.dart';
import 'package:hdwallpaper/view/bottomnavigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () =>
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//                      Image(image: AssetImage('assets/logo.png'),height: 50,width: 50,),
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 50.0,
////                        child: Icon(
////                          Icons.wallpaper,
////                          color: Colors.greenAccent,
////                          size: 50.0,
////                        ),
//                          child: Image(image: AssetImage('assets/logo.png'),height: 50,width: 50,),
//                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text("HD",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                      ),
                        Text("Wallpaper",
                        style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0),),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                    CupertinoActivityIndicator(
//                      radius: 24,
//                    ),
                    SpinKitPouringHourglass(color: Theme.of(context).accentColor),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
//                    Text("Hd Wallpaper\n For Everyone",
//                      softWrap: true,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 18.0,
//                          color: Colors.white),
//                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
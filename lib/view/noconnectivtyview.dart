import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hdwallpaper/view/bottomnavigation_menu.dart';
import 'package:hdwallpaper/widget/widget.dart';

class NoConnectivtyView extends StatelessWidget {

  //  _checkInternetConnectivity() async {
  //   var result = await Connectivity().checkConnectivity();
  //   if (result == ConnectivityResult.none) {
  //        Navigator.push(MaterialPageRoute(builder: (context)=> NoConnectivtyView));
  //       Fluttertoast.showToast(
  //                   msg: "No connection",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.blue,
  //                   textColor: Colors.white,
  //                   fontSize: 16.0
                    
  //               );
  //   } else if (result == ConnectivityResult.mobile) {
  //     nav.currentState.push(MaterialPageRoute(
  //         builder: (BuildContext _) => BottomNavigationMenu()
  //       ));
  //        Fluttertoast.showToast(
  //                   msg: "Connected To Data",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.blue,
  //                   textColor: Colors.white,
  //                   fontSize: 16.0
                    
  //               );
  //   } else if (result == ConnectivityResult.wifi) {
  //     nav.currentState.push(MaterialPageRoute(
  //         builder: (BuildContext _) => BottomNavigationMenu()
  //       ));
  //       Fluttertoast.showToast(
  //                   msg: "Connected To Wifi",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.blue,
  //                   textColor: Colors.white,
  //                   fontSize: 16.0
                    
  //               );
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
       appBar: AppBar(
         title: Align(
             alignment: Alignment.center,
             child: Text("HDWallpaper",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
         automaticallyImplyLeading: false,
         elevation: 0.0,
         backgroundColor: Theme.of(context).primaryColor,

       ),
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children: <Widget>[
               Align(
                 alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(top:40.0),
                               child : Column(
                    children: <Widget>[
                      Image(image: AssetImage('assets/img1.png'),fit: BoxFit.cover,),
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Text("No connection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                      Padding(
                        padding: EdgeInsets.only(top:10.0),
                        child: Text("Please check your internet connection",style: TextStyle(fontSize: 14.0),textAlign: TextAlign.justify,)),
                      Text("and try again",style: TextStyle(fontSize: 14.0),),
                      Padding(
                        padding: EdgeInsets.only(top:25.0),
                        child: RaisedButton(onPressed: () {
                          // _checkInternetConnectivity();
                        },
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        color: Color.fromRGBO(243, 118, 112, 10),
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        elevation: 0.0,
                        child: Text("TRY AGAIN",style: TextStyle(fontSize: 14.0),),textColor: Colors.white,),
                      )
                    ],
                 ),
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
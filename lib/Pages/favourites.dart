import 'package:flutter/material.dart';
import 'package:hdwallpaper/widget/widget.dart';

class Favourites extends StatefulWidget {
  
  @override
  _FavouritesState createState() => _FavouritesState();  
}


class _FavouritesState extends State<Favourites> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Favourites",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
         elevation: 0.0,
         backgroundColor: Theme.of(context).primaryColor,
         actions: <Widget>[
           Container(
               padding: EdgeInsets.symmetric(horizontal: 16),
               child: Icon(
                 Icons.add,
                 color: Theme.of(context).accentIconTheme.color,
               ))
         ],
       ),
       backgroundColor: Theme.of(context).primaryColor,
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children: <Widget>[
               Text("Settings Page")
             ],
           ),
         ),
       ),
    );
  }
}
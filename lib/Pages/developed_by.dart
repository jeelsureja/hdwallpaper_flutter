import 'package:flutter/material.dart';

class DevelopedBy extends StatefulWidget {
  @override
  _DevelopedByState createState() => _DevelopedByState();
}

class _DevelopedByState extends State<DevelopedBy> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Text("Developer By",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.add,
                color: Theme.of(context).accentIconTheme.color,
              )),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Card(
            
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.android),
                    Text("HdWallpaper")
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("Version"),
                  subtitle: Text("1.0"),
                ),
                ListTile(
                  leading: Icon(Icons.system_update),
                  title: Text("Check for update"),
                  subtitle: Text("www.abc.com"),
                )
              ],
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Developer")),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Jeel Sureja"),
                  subtitle: Text("India"),
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("Contact Me"),
                  subtitle: Text("www.abc.com"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

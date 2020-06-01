import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Text("About App",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left:15.0,top: 8.0),
                          child: Image(image: AssetImage('assets/logo.png'),height: 50,width: 50,)
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:25.0,top:8.0),
                          child: Text("HDWallpaper",style: TextStyle(fontSize: 25.0),))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:15.0),
                    child: ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("Version"),
                      subtitle: Text("1.0"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.system_update),
                    title: Text("Check for update"),
                    subtitle: Text("www.abc.com"),
                  )
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top:220.0),
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left:15.0,top:8.0),
                          child: Text("Developer"))),
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
          ),
          ],
        ),
      ),
    );
  }
}

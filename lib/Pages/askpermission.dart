import 'package:flutter/material.dart';

class AskPermission extends StatefulWidget {
  @override
  _AskPermissionState createState() => _AskPermissionState();
}

class _AskPermissionState extends State<AskPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  Text("Location"),
                  Text("Location")
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.storage),
                  Text("Location"),
                  Text("to store media")
                ],
              ),
              Row(
                children: <Widget>[
                  RaisedButton(child: Text("Allow"),
                    onPressed: () {

                  },)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

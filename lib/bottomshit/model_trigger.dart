import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelTrigger extends StatelessWidget {

  _showModalBottomSheet(context){
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 230,
        decoration: BoxDecoration(
            color: Theme.of(context).accentIconTheme.color,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(icon: Icon(CupertinoIcons.clear_circled,size: 35,), onPressed: () {
                Navigator.pop(context);
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
                child: Text("Set Wallpaper",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
          Row(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top:83,left: 50),
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.home),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: CircleAvatar(
                          child: Icon(Icons.phonelink_lock),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: CircleAvatar(
                          child: Icon(Icons.wallpaper),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 125,left: 50),
            child: Row(
              children: <Widget>[
                Text("Home"),
                Padding(
                  padding: const EdgeInsets.only(left: 78),
                  child: Text("Lock"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text("Both"),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:160,left: 50),
                    child: SizedBox(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            child: Icon(Icons.file_download),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: CircleAvatar(
                              child: Icon(Icons.share),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: CircleAvatar(
                              child: Icon(Icons.favorite_border),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 208,left: 40),
            child: Row(
              children: <Widget>[
                Text("Download"),
                Padding(
                  padding: const EdgeInsets.only(left: 58),
                  child: Text("Share"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text("Favorite"),
                ),
              ],
            ),
          ),
        ],
        ),
      );
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          radius: 30,
          child: IconButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: Icon(Icons.touch_app,size: 30.0,color: Theme.of(context).primaryColor,),
          ),
        ),
      ),
    );
  }
}

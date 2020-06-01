import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hdwallpaper/data/data.dart';
import 'package:hdwallpaper/models/categorie_model.dart';
import 'package:hdwallpaper/models/photos_model.dart';
import 'package:hdwallpaper/view/categorie_screen.dart';
import 'package:hdwallpaper/widget/widget.dart';



class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategorieModel> categories = new List();

  int noOfImageToLoad = 40;
  List<PhotosModel> photos = new List();

  TextEditingController searchController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    //getWallpaper();
    categories = getCategories();
    super.initState();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Align(
          alignment: Alignment.center,
          child: Text("Collections",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
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
             
              Container(
                height: 600,
                margin: EdgeInsets.only(top:20.0),
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      /// Create List Item tile
                      return CategoriesTile(
                        imgUrls: categories[index].imgUrl,
                        categorie: categories[index].categorieName,
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(
//                    "Photos provided By ",
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontSize: 12,
//                        fontFamily: 'Overpass'),
//                  ),
//                  GestureDetector(
//                    onTap: () {
//                      _launchURL("https://www.pexels.com/");
//                    },
//                    child: Container(
//                        child: Text(
//                      "Pexels",
//                      style: TextStyle(
//                          color: Colors.blue,
//                          fontSize: 12,
//                          fontFamily: 'Overpass'),
//                    )),
//                  )
//                ],
//              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  CategoriesTile({@required this.imgUrls, @required this.categorie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategorieScreen(
                      categorie: categorie,
                    )));
      },
      child: Container(
       
        child
            : Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 2.0),
                                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:  Image.network(
                                imgUrls,
                                height: 170,
                                width: 700,
                                fit: BoxFit.cover,
                              )
                           ),
                  ),
                      Padding(
                        padding: EdgeInsets.only(top:10.0,left: 15.0),
                                              child: Text(
                          categorie ?? "Yo Yo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                      )
                ],
              ),
      ),
    );
  }
}
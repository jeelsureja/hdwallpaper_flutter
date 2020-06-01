import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hdwallpaper/Pages/about_page.dart';
import 'package:hdwallpaper/Pages/categories.dart';
import 'package:hdwallpaper/Pages/favourites.dart';
import 'package:hdwallpaper/Pages/settings.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hdwallpaper/data/data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
// import 'package:hdwallpaper/models/categorie_model.dart';
import 'package:hdwallpaper/models/photos_model.dart';
// import 'package:hdwallpaper/view/categorie_screen.dart';
import 'package:hdwallpaper/view/search_view.dart';
import 'package:hdwallpaper/widget/widget.dart';
import 'package:hdwallpaper/values/theme.dart';
import 'package:hdwallpaper/util/theme_notifier.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day_night_switch/day_night_switch.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: Home(),
        ),
      );
    });
  });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<CategorieModel> categories = new List();
  var _darkTheme = true;

  int noOfImageToLoad = 80;
  List<PhotosModel> photos = new List();

  getTrendingWallpaper() async {
    await http.get(
        "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1",
        headers: {"Authorization": apiKEY}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  // TextEditingController searchController = new TextEditingController();

  

  @override
  void initState() {
    //getWallpaper();
    _askPermission();
    getTrendingWallpaper();
    // categories = getCategories();
    super.initState();

    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     noOfImageToLoad = noOfImageToLoad + 30;
    //     getTrendingWallpaper();
    //   }
    // });
  }

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add,color: Theme.of(context).accentIconTheme.color,),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text("Hdwallpaper",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
       backgroundColor: Theme.of(context).primaryColor,
      endDrawer: Drawer(
        elevation: 0.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("#HDWallpaper",style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
           ListTile(

            title: Text('Dark Theme',style: TextStyle(color: Theme.of(context).accentColor,),),
            leading: Icon(Icons.settings_brightness,color: Theme.of(context).accentColor,),
            contentPadding: const EdgeInsets.only(left: 16.0),
            trailing: Transform.scale(
              scale: 0.4,
              child: DayNightSwitch(
                value: _darkTheme,
                onChanged: (val) {
                  setState(() {
                    _darkTheme = val;
                  });
                  onThemeChanged(val, themeNotifier);
                },
              ),
              ),
          ),
              Divider(),
            ListTile(
              leading: Icon(Icons.dashboard,color: Theme.of(context).accentColor),
              title: Text("Collections",style: TextStyle(color: Theme.of(context).accentColor,)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Categories()));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CategoriesPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite,color: Theme.of(context).accentColor),
              title: Text("Saved Items",style: TextStyle(color: Theme.of(context).accentColor,)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Favourites()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info,color: Theme.of(context).accentColor),
              title: Text("About App",style: TextStyle(color: Theme.of(context).accentColor,)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> AboutPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings,color: Theme.of(context).accentColor),
              title: Text("Settings",style: TextStyle(color: Theme.of(context).accentColor,)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> Settings()));
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                    child: Text("Made By Jeel Sureja",style: TextStyle(color: Theme.of(context).accentColor,)
                    )
                )
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     color: Color(0xfff5f8fd),
              //     borderRadius: BorderRadius.circular(30),
              //   ),
              //   margin: EdgeInsets.symmetric(horizontal: 24),
              //   padding: EdgeInsets.symmetric(horizontal: 24),
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //           child: TextField(
              //         controller: searchController,
                      
              //         decoration: InputDecoration(
                        
              //             hintText: "search wallpapers",
              //             hintStyle: TextStyle(
              //               color: Theme.of(context).accentIconTheme.color,
              //             ),
              //             border: InputBorder.none),
              //       )),
              //       InkWell(
              //           onTap: () {
              //             if (searchController.text != "") {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => SearchView(
              //                             search: searchController.text,
              //                           )));
              //             }
              //           },
              //           child: Container(child: Icon(Icons.search,color: Theme.of(context).accentIconTheme.color,)))
              //     ],
              //   ),
              // ),
//              SizedBox(
//                height: 16,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text(
//                    "Made By ",
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontSize: 12,
//                        fontFamily: 'Overpass'),
//                  ),
//                  GestureDetector(
//                    onTap: () {
//                      _launchURL("https://www.linkedin.com/in/jeelsureja/");
//                    },
//                    child: Container(
//                        child: Text(
//                      "Jeel Sureja",
//                      style: TextStyle(
//                          color: Colors.blue,
//                          fontSize: 12,
//                          fontFamily: 'Overpass'),
//                    )),
//                  ),
//                ],
//              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 80,
              //   child: ListView.builder(
              //       padding: EdgeInsets.symmetric(horizontal: 24),
              //       itemCount: categories.length,
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         /// Create List Item tile
              //         return CategoriesTile(
              //           imgUrls: categories[index].imgUrl,
              //           categorie: categories[index].categorieName,
              //         );
              //       }),
              // ),
              wallPaper(photos, context),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       "Photos provided By ",
              //       style: TextStyle(
              //           color: Colors.black54,
              //           fontSize: 12,
              //           fontFamily: 'Overpass'),
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         _launchURL("https://www.pexels.com/");
              //       },
              //       child: Container(
              //           child: Text(
              //         "Pexels",
              //         style: TextStyle(
              //             color: Colors.blue,
              //             fontSize: 12,
              //             fontFamily: 'Overpass'),
              //       )),
              //     )
              //   ],
              // ),

            ],
          ),
        ),
      ),
    );
  }

  _askPermission() async {
    if(Platform.isAndroid){
      await PermissionHandler()
          .requestPermissions([PermissionGroup.storage,PermissionGroup.locationWhenInUse]);
    }
    else{
      await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }

  void onThemeChanged(bool value,ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}

// class CategoriesTile extends StatelessWidget {
//   final String imgUrls, categorie;

//   CategoriesTile({@required this.imgUrls, @required this.categorie});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CategorieScreen(
//                       categorie: categorie,
//                     )));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 8),
//         child: kIsWeb
//             ? Column(
//                 children: <Widget>[
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: kIsWeb
//                           ? Image.network(
//                               imgUrls,
//                               height: 50,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )
//                           : CachedNetworkImage(
//                               imageUrl: imgUrls,
//                               height: 50,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Container(
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: Text(
//                         categorie,
//                         style: TextStyle(
//                             color: Colors.black54,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'Overpass'),
//                       )),
//                 ],
//               )
//             : Stack(
//                 children: <Widget>[
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: kIsWeb
//                           ? Image.network(
//                               imgUrls,
//                               height: 50,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )
//                           : CachedNetworkImage(
//                               imageUrl: imgUrls,
//                               height: 50,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )),
//                   Container(
//                     height: 50,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.black26,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   Container(
//                       height: 50,
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: Text(
//                         categorie ?? "Yo Yo",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Overpass'),
//                       ))
//                 ],
//               ),
//       ),
//     );
//   }
// }

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "HD",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      )
    ],
  );
}


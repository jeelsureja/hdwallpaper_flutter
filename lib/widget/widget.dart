import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hdwallpaper/models/photos_model.dart';
import 'package:hdwallpaper/view/image_view.dart';
import 'package:hdwallpaper/models/categorie_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(

    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,

        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((PhotosModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => ImageView(
//                            imgPath: photoModel.src.portrait,
//                          ))
//              );9
            Navigator.push(
                context, PageRouteBuilder(
              transitionDuration: Duration(seconds: 2),
                pageBuilder: (BuildContext context,Animation<double> animation,Animation<double> secAnimation){
                  return ImageView(imgPath: photoModel.src.portrait);
                },
              transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
                  Widget child){
                animation = CurvedAnimation(parent: animation,curve: Curves.easeInCubic);
              return ScaleTransition(
                scale: animation,
                child: child,
              );

              },

            )
            );
            },
            child: Hero(
              tag: photoModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}




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

Widget categorie() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Collections",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
    ],
  );
}

Widget favourite() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Favourites",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
    ],
  );
}

Widget settings() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Settings",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
    ],
  );
}

Widget privacypolicy() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Privacy Policy",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
    ],
  );
}

Widget catwall() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      
    ],
  );
}
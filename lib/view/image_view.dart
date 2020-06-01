import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hdwallpaper/Pages/home.dart';
import 'package:hdwallpaper/view/bottomnavigation_menu.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hdwallpaper/bottomshit/model_trigger.dart';
import 'package:hdwallpaper/models/photos_model.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';


class ImageView extends StatefulWidget {
  final String imgPath;

  ImageView({@required this.imgPath});


  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
   static const platform = const MethodChannel('com.example.hdwallpaper/wallpaper');
   bool showBottomMenu = false;


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    

    double height = MediaQuery.of(context).size.height;
    var threshold = 100;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      backgroundColor: Theme.of(context).accentColor,
      child: IconButton(icon: Icon(Icons.format_paint,color: Theme.of(context).primaryColor,size: 30,), onPressed: () {
        setWallpaperDialog();
      })
      ),
      bottomNavigationBar: BottomAppBar(color: Theme.of(context).primaryColor, 
      child: Container(
        height: 85,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("   Photo\n        By\n         abc",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                )
                ),
              ],
            ),
            Row(
              children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:250,top:40),
                     child: Row(
                      children: <Widget>[
                        // Icon(Icons.favorite_border),
                        // Icon(FeatherIcons.download,size: 30,),
                        // Icon(FeatherIcons.share2,size: 30,),
                        IconButton(icon: Icon(Icons.favorite_border,size: 32,), onPressed: () {

                        }),
                        IconButton(icon: Icon(FeatherIcons.download,size: 32,), onPressed: () {
                          _save();
                        }),
                        IconButton(icon: Icon(FeatherIcons.share2,size: 32,), onPressed: () {})
                      ],
                  ),
                   ),
                
              ],
            )
          ],
        ),
      )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//      floatingActionButton: SpeedDial(
//
//                      animatedIcon: AnimatedIcons.menu_close,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(16))
//                      ),
//                        children: [
//                          SpeedDialChild(
//                            child: Icon(Icons.favorite),
//                            label: 'Favorite',
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.all(Radius.circular(16))
//                              ),
//                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),
//
//                            onTap: () {
//                              print("Added To Favorite");
//                            }
//                          ),
//                          SpeedDialChild(
//                            child: Icon(Icons.file_download),
//
//                            label: 'Download',
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.all(Radius.circular(16))
//                              ),
//                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),
//                            onTap: () {
//                              _save();
//                            }
//                          ),
//                          SpeedDialChild(
//                            child: Icon(Icons.share),
//
//                            label: 'Share',
//                              shape: RoundedRectangleBorder(
//                                  borderRadius: BorderRadius.all(Radius.circular(16))
//                              ),
//                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),
//                            onTap: () {
//                              // _onImageShareButtonPressed();
//                            }
//                          ),
//                          SpeedDialChild(
//                            child: Icon(Icons.wallpaper),
//
//                            label: 'Set Wallpaper',
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.all(Radius.circular(16))
//                            ),
//                            labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),
//                            onTap:setWallpaperDialog,
//                          ),
//                        ],
//                      ),
      body: Container(
          height: height,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: widget.imgPath,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: kIsWeb
                        ? Image.network(widget.imgPath, fit: BoxFit.cover)
                        : CachedNetworkImage(
                            imageUrl: widget.imgPath,
                            placeholder: (context, url) => Container(
                              color: Color(0xfff5f8fd),
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top:35.0,left: 15.0),
                                                    child: CircleAvatar(
                                                      radius: 25.0,
                                                      backgroundColor: Theme.of(context).accentColor,
                                                      child: IconButton(icon: Icon(Icons.close,size: 25.0,color: Theme.of(context).primaryColor,), onPressed: () {
                                                        Navigator.pop(context);
                                                      }),
                                                    )
                            ),
                ),
               

//                          AnimatedOpacity(
//                            duration: Duration(milliseconds: 200),
//                            opacity: (showBottomMenu)?1.0:0.0,
//                            child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
//                              child: Container(
//                                color: Colors.black.withOpacity(0.2),
//                              ),
//                            ),
//                          ),
//                          AnimatedPositioned(
//                            curve: Curves.easeInOut,
//                            duration: Duration(milliseconds: 200),
//                            left: 0,
//                            bottom: (showBottomMenu)?-60:-(height/2.4),
//                              child: MenuWidget()
//                          ),

//                    GestureDetector(
//                      onPanEnd: (details){
//                        if(details.velocity.pixelsPerSecond.dy > threshold){
//                          this.setState((){
//                            showBottomMenu = false;
//                          });
//                        } else if(details.velocity.pixelsPerSecond.dy < threshold){
//                          this.setState((){
//                            showBottomMenu = true;
//                          });
//                        }
//                      },
//                      child: FloatingActionButton(
//                        child: Icon(Icons.touch_app),
//                          onPressed: () {
//                          showBottomMenu = true;
//                          }
//                      ),
//                    ),
                    //  Theme(data: Theme.of(context).copyWith(canvasColor: Colors.transparent), child: ModelTrigger())

              ],
            ),
        ),
    );

  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Set a wallpaper',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home Screen',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onTap: () => _setWallpaper(1),
              ),
              ListTile(
                title: Text(
                  'Lock Screen',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.phonelink_lock,
                  color: Colors.black,
                ),
                onTap: () => _setWallpaper(2),
              ),
              ListTile(
                title: Text(
                  'Both',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
                onTap: () => _setWallpaper(3),
              ),
            ],
          ),
        );
      },
    );
  }



  _save() async {
    await _askPermission();
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
        
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    // // Navigator.pop(context);

    Fluttertoast.showToast(
        msg: "Wallpaper Download",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).accentColor,
        textColor: Theme.of(context).primaryColor,
        fontSize: 16.0
        
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
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */await PermissionHandler()
              .requestPermissions([PermissionGroup.photos]);
    } else {
     /* PermissionStatus permission = */await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }

  Future<void> _setWallpaper(int wallpaperType) async {
    var file =
        await DefaultCacheManager().getSingleFile(widget.imgPath);
    try {
      final int result = await platform
          .invokeMethod('setWallpaper', [file.path, wallpaperType]);
      print('Wallpaer Updated.... $result');
    } on PlatformException catch (e) {
      print("Failed to Set Wallpaer: '${e.message}'.");
    }
    Fluttertoast.showToast(
        msg: "Wallpaper set successfully",
        toastLength: Toast.LENGTH_SHORT,

        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
//        Navigator.pop(context,'success');
//    Navigator.pop(context);
          Navigator.of(context).pop();
  }
}

//class MenuWidget extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//
//    return ClipRRect(
//      borderRadius: BorderRadius.all(Radius.circular(20.0)),
//      child: Container(
//        color: Colors.deepOrangeAccent,
//        width: width,
//        height: height/2.4 + 60,
//        child: Padding(
//          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
//          child: Stack(
//            children: <Widget>[
//              Center(
//                child: Column(
//                  children: <Widget>[
//                    Icon(
//                      Icons.keyboard_arrow_up,
//                      size: 20,
//                    ),
//                    Text(
//                      "Actions",
//                      style: TextStyle(
//                          fontSize: 15,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.white
//                      ),
//                    ),
//                    Text(
//                      "Choose whichever you use frequently!",
//                      style: TextStyle(fontSize: 10,color: Colors.white),
//                    ),
//                  ],
//                ),
//              ),
//              Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(top:80,left: 50),
//                    child: SizedBox(
//                        child: Row(
//                          children: <Widget>[
//                            CircleAvatar(
//                              child: Icon(Icons.home),
//                            ),
//
//                            Padding(
//                              padding: const EdgeInsets.only(left: 50.0),
//                              child: CircleAvatar(
//                                child: Icon(Icons.phonelink_lock),
//                              ),
//                            ),
//
//                            Padding(
//                              padding: const EdgeInsets.only(left: 50.0),
//                              child: CircleAvatar(
//                                child: Icon(Icons.wallpaper),
//                              ),
//                            ),
//
//                          ],
//                        ),
//                    ),
//                  ),
//                ],
//              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 130,left: 25),
//                child: Row(
//                  children: <Widget>[
//                    Text("Home Screen"),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20),
//                      child: Text("Lock screen"),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 30),
//                      child: Text("Both"),
//                    ),
//                  ],
//                ),
//              ),
//             Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(top:160,left: 50),
//                       child: SizedBox(
//                         child: Row(
//                           children: <Widget>[
//                             CircleAvatar(
//                               child: Icon(Icons.file_download),
//                             ),
//
//                             Padding(
//                               padding: const EdgeInsets.only(left: 50.0),
//                               child: CircleAvatar(
//                                 child: Icon(Icons.share),
//                               ),
//                             ),
//
//                             Padding(
//                               padding: const EdgeInsets.only(left: 50.0),
//                               child: CircleAvatar(
//                                 child: Icon(Icons.favorite_border),
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//              Padding(
//                padding: const EdgeInsets.only(top: 208,left: 40),
//                child: Row(
//                  children: <Widget>[
//                    Text("Download"),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 38),
//                      child: Text("Share"),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 45),
//                      child: Text("Favorite"),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

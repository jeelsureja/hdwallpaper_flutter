import 'dart:io';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hdwallpaper/Pages/home.dart';
import 'package:hdwallpaper/Pages/splash_screen.dart';
import 'package:hdwallpaper/view/noconnectivtyview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hdwallpaper/view/bottomnavigation_menu.dart';
import 'package:hdwallpaper/util/theme_notifier.dart';
import 'package:hdwallpaper/values/theme.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
         ChangeNotifierProvider<ThemeNotifier>(
           create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: MyApp(),
        ),
      );
    });
  });
}

final GlobalKey<NavigatorState> nav = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  StreamSubscription connectivitySubscription;

  ConnectivityResult _previousResult;

  @override
  void initState() {
  // createFolderInAppDocDir();
  // createDir();

    super.initState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) { 
        nav.currentState.push(MaterialPageRoute(
          builder: (BuildContext _) => NoConnectivtyView()
          
        ));Fluttertoast.showToast(msg: 'you are offline');
      }
      else if (_previousResult == ConnectivityResult.none){
        nav.currentState.push(MaterialPageRoute(
            builder: (BuildContext _) => Home()
        ));Fluttertoast.showToast(msg: 'back to online');
      }

      _previousResult = connectivityResult;
    });
  }

  @override
  void dispose() {
    super.dispose();

    connectivitySubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      navigatorKey: nav,
      title: 'Hd Wallpaper',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      // ),
       theme: themeNotifier.getTheme(),
      home: new Scaffold(body: SplashScreen(),),
    );
  }


  
  
}



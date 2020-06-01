import 'package:flutter/material.dart';
import 'package:hdwallpaper/Pages/categories.dart';
import 'package:hdwallpaper/Pages/favourites.dart';
import 'package:hdwallpaper/Pages/settings.dart';
import 'package:hdwallpaper/Pages/home.dart';
import 'package:hdwallpaper/values/theme.dart';
import 'package:hdwallpaper/util/theme_notifier.dart';
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
          child: BottomNavigationMenu(),
        ),
      );
    });
  });
}


class BottomNavigationMenu extends StatefulWidget {
  
  @override
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();  
}


class _BottomNavigationMenuState extends State<BottomNavigationMenu> {

  int _selectedPage = 0;
  final _pageOption = [
      Home(),
      Categories(),
      Favourites(),
      Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hd Wallpaper',
      theme: themeNotifier.getTheme(),
      home: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: _pageOption[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
           backgroundColor: Theme.of(context).accentColor,
            
            
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;

              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_hdr,size: 25.0,color: Theme.of(context).accentColor,),
                title: Text('Wallpapers',style: TextStyle(color: Theme.of(context).accentColor),)
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.dashboard,size: 25.0,color: Theme.of(context).accentColor,),
                title: Text('Collections',style: TextStyle(color: Theme.of(context).accentColor))
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.favorite,size: 25.0,color: Theme.of(context).accentColor,),
                title: Text('Favourites',style: TextStyle(color: Theme.of(context).accentColor))
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.settings,size: 25.0,color: Theme.of(context).accentColor,),
                title: Text('Settings',style: TextStyle(color: Theme.of(context).accentColor))
              ),
            ],
          ),
      ),
    );
  }
}
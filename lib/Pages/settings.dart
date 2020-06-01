import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hdwallpaper/Pages/developed_by.dart';
import 'package:hdwallpaper/Pages/privacy_policy.dart';
import 'package:hdwallpaper/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hdwallpaper/util/theme_notifier.dart';
import 'package:hdwallpaper/values/theme.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Settings extends StatefulWidget {
  
  @override
  _SettingsState createState() => _SettingsState();  
}


class _SettingsState extends State<Settings> {

  String text = 'Hey this is pretty coool,check it out!->HDwallpaper';
  String subject = 'http://play.google.com/store/apps/details?id=';
  var _darkTheme = true;



  @override
  Widget build(BuildContext context) {
     final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return new Scaffold(
       appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Settings",style: TextStyle(color: Theme.of(context).accentColor,fontFamily: 'Overpass'),)),
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
       body:  Stack(
             children: <Widget>[
               ListView( 
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(left: 40.0),
              //     child: ListTile(
              //     title: Text("Dark Theme"),
              //     trailing: Switch(value: false, activeColor: Colors.black,onChanged: (changedTheme) {

              //     }),
              //   ),
              // ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text("Options",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color:  Theme.of(context).accentColor),
                  )
              ),
              ListTile(

            title: Text('Dark Theme',style: TextStyle(color: Theme.of(context).accentColor,),),
            subtitle: Text('Reduce glare & improve night viewing',style: TextStyle(color: Theme.of(context).accentColor,)),
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
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                  child: Text("About",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color:  Theme.of(context).accentColor),
                  )
              ),
               ListTile(
                title: Text("Recommend",style: TextStyle(color: Theme.of(context).accentColor,)),
                leading: Icon(Icons.share,color: Theme.of(context).accentColor,),
                subtitle: Text("Share this app with friends and family"),
                onTap: (){
                   
                },
            ),
            ListTile(
                title: Text("Rate App",style: TextStyle(color: Theme.of(context).accentColor,)),
                leading: Icon(Icons.rate_review,color: Theme.of(context).accentColor,),
                subtitle: Text("Leave a review on the google Play Store"),
                onTap: (){
                  Fluttertoast.showToast(
                    msg: "Rate App",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                    
                );
                },
              ),
           ListTile(
                title: Text("Privacy Policy",style: TextStyle(color: Theme.of(context).accentColor,)),
                leading: Icon(Icons.assignment,color: Theme.of(context).accentColor,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                },
              ),
            ListTile(
                title: Text("Developed By",style: TextStyle(color: Theme.of(context).accentColor,)),
                leading: Icon(Icons.account_circle,color: Theme.of(context).accentColor,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DevelopedBy()));
                },
              ),
              ListTile(
                title: Text("Storage Location",style: TextStyle(color: Theme.of(context).accentColor,)),
                subtitle: Text("/storage/emulated/0/hdwallpaper"),
                leading: Icon(Icons.storage,color: Theme.of(context).accentColor,),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("App Version",style: TextStyle(color: Theme.of(context).accentColor,)),
                leading: Icon(Icons.android,color: Theme.of(context).accentColor,),
                subtitle: Text("1.0"),
                onTap: (){
                  Fluttertoast.showToast(
                    gravity: ToastGravity.CENTER,
                    msg: "Check App Version",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                    
                );
                },
            ),
             
            ],
          ),

             ],
           ),
         );
  }
  void onThemeChanged(bool value,ThemeNotifier themeNotifier) async {
  (value)
      ? themeNotifier.setTheme(darkTheme)
      : themeNotifier.setTheme(lightTheme);
  var prefs = await SharedPreferences.getInstance();
  prefs.setBool('darkMode', value);
}
}
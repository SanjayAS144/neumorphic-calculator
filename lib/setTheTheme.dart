import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/NewHomeActivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NewDarkHomeActivity.dart';
import 'NewHomeActivity.dart';


class setTheTheme extends StatefulWidget {
  @override
  _setTheThemeState createState() => _setTheThemeState();
}

class _setTheThemeState extends State<setTheTheme> {
  bool lightTheme = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightTheme ? Colors.grey[300] : Colors.grey[900],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           Container(
             width: 50,
             decoration: BoxDecoration(
               color: Colors.transparent,
               borderRadius: BorderRadius.circular(20),
               boxShadow: lightTheme ? LightMode() : DarkMode(),
             ),
             margin: EdgeInsets.only(top: 10,left: 10),
             alignment: Alignment.topLeft,
             child: CupertinoSwitch(
                value: lightTheme,
                activeColor: Colors.grey[350],
                trackColor: Colors.black38,
                onChanged: (bool value){
                  setState(() {
                    lightTheme = ! lightTheme;
                    print(lightTheme);
                  });
                },
              ),
           ),
            Expanded(
              child: lightTheme ? NewHomeActivity() : NewDarkHomeActivity(),
            )

          ],
        ),
      ),
    );
  }

  List<BoxShadow> LightMode() {
    return [
      BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.5, 2.5),
          blurRadius: 15.0,
          spreadRadius: 2.0),
      BoxShadow(
          color: Colors.white,
          offset: Offset(-3.0, -3.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
    ];
  }

  List<BoxShadow> DarkMode() {
    return [
      BoxShadow(
          color: Colors.black54.withOpacity(0.5),
          offset: Offset(-3.5,-3.5),
          blurRadius: 6.0,
          spreadRadius: 1.0),
      BoxShadow(
          color: Colors.grey[600].withOpacity(0.2),
          offset: Offset(2.5, 1.0),
          blurRadius: 6.0,
          spreadRadius: 1.0),
    ];
  }
}

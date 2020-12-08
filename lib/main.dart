import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/setTheTheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NewDarkHomeActivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lightTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: setTheTheme(),
    );
  }
}








class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  //Creating Button widget
  bool _isPressed = false;
  String output = "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  PressedButton(String val) {
    print(val);
    //Calculator condition
    if (val == 'C') {
      _out = "0";
      double num1 = 0.0;
      double num2 = 0.0;
      String operand = "";
    } else if (val == '+' || val == '-' || val == 'X' || val == '÷') {
      num1 = double.parse(output);
      operand = val;
      _out = "0";
      output = output + val;
    } else if (val == '.') {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + val;
      }
    } else if (val == '=') {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num1 + num2).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "X") {
        _out = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    } else if (val == '<-') {
      output.toString().startsWith('-')
          ? output = output.toString().substring(1)
          : output = '-' + output.toString();
      _out = output;
    } else {
      _out = _out + val;
    }
    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget CalcBtn(String BtnVal) {
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (BtnVal.contains('0') ? 2.2 : 1);
    final buttenSize = Size(buttonWidth, squareSideLength);
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: buttenSize.width,
        height: buttenSize.height,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttenSize.width),
          color: Colors.grey[300],
          boxShadow: _isPressed ? showInnerShadow() : showShadow(),
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttenSize.width),
          ),
          child: Align(
            alignment: Alignment(0, 0),
            child: Text(
              BtnVal,
              style: GoogleFonts.montserrat(
                fontSize:
                    BtnVal.contains('.') || BtnVal.contains('-') ? 45.0 : 25.0,
                fontWeight: FontWeight.w400,
                shadows: [
                  Shadow(
                      offset: Offset(3, 3),
                      color: Colors.black38,
                      blurRadius: 10),
                  Shadow(
                      offset: Offset(-3, -3),
                      color: Colors.white.withOpacity(0.85),
                      blurRadius: 10)
                ],
                color: Colors.grey.shade500,
              ),
            ),
          ),
          onPressed: () => PressedButton(BtnVal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 45, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(2.5, 2.5),
                            blurRadius: 15.0,
                            spreadRadius: 2.0),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3.0, -3.0),
                            blurRadius: 15.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: AutoSizeText(
                      output,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 30,
                      softWrap: false,
                      style: GoogleFonts.montserrat(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w300,
                        shadows: [
                          Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black38,
                              blurRadius: 10),
                          Shadow(
                              offset: Offset(-3, -3),
                              color: Colors.white.withOpacity(0.85),
                              blurRadius: 10)
                        ],
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Divider(
              //     color: Colors.grey[300],
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //add the custom button
                      CalcBtn("."),
                      CalcBtn("C"),
                      CalcBtn("<-"),
                      CalcBtn("X"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //add the custom button
                      CalcBtn("7"),
                      CalcBtn("8"),
                      CalcBtn("9"),
                      CalcBtn("÷"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //add the custom button
                      CalcBtn("4"),
                      CalcBtn("5"),
                      CalcBtn("6"),
                      CalcBtn("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //add the custom button
                      CalcBtn("1"),
                      CalcBtn("2"),
                      CalcBtn("3"),
                      CalcBtn("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //add the custom button
                      CalcBtn("0"),
                      CalcBtn("="),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<BoxShadow> showShadow() {
    return [
      BoxShadow(
          color: Colors.grey[500],
          offset: Offset(2.0, 2.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
      BoxShadow(
          color: Colors.white,
          offset: Offset(-2.0, -2.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
    ];
  }

  List<BoxShadow> showInnerShadow() {
    return [
      BoxShadow(
          color: Colors.grey[500],
          offset: Offset(-2.0, -2.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
      BoxShadow(
          color: Colors.white,
          offset: Offset(2.0, 2.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
    ];
  }
}

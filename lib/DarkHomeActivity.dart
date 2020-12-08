import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkHomeActivity extends StatefulWidget {
  @override
  _DarkHomeActivityState createState() => _DarkHomeActivityState();
}

class _DarkHomeActivityState extends State<DarkHomeActivity> {
  //Creating Button widget
  bool _isPressed = false;

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
          color: Colors.grey[850],
          boxShadow: _isPressed ? showShadow() : showInnerShadow(),
        ),
        child: MaterialButton(
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
                      color: Colors.black12.withOpacity(0.85),
                      blurRadius: 10)
                ],
                color: Colors.grey.shade500,
              ),
            ),
          ),
          onPressed: () => {
            _isPressed = true,
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-3,-3),
                        blurRadius: 15.0,
                        spreadRadius: 2.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 15.0,
                        spreadRadius: 2.0),
                  ],
                ),
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: AutoSizeText(
                  '1,234',
                  maxLines: 3,
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
                          color: Colors.black12.withOpacity(0.85),
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
    );
  }

  List<BoxShadow> showShadow() {
    return [
      BoxShadow(
          color: Colors.black12,
          offset: Offset(-3, -3),
          blurRadius: 15.0,
          spreadRadius: 2.0),
      BoxShadow(
          color: Colors.black12,
          offset: Offset(5.0, 5.0),
          blurRadius: 15.0,
          spreadRadius: 2.0),
    ];
  }

  List<BoxShadow> showInnerShadow() {
    return [
      BoxShadow(
          color: Colors.black38,
          offset: Offset(-3.5, -3.5),
          blurRadius: 6.0,
          spreadRadius: 1.0),
      BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          offset: Offset(4.0, 4.0),
          blurRadius: 6.0,
          spreadRadius: 1.0),
    ];
  }
}

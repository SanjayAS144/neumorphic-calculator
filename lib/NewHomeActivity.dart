import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kOrange = Color.fromRGBO(238, 134, 48, 1);
class NewHomeActivity extends StatefulWidget {
  @override
  _NewHomeActivityState createState() => _NewHomeActivityState();
}

class _NewHomeActivityState extends State<NewHomeActivity> {
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

  PressedButton(String val){
    //Calculator condition
    if(val == 'AC'){
      _out = "0";
      double num1 = 0.0;
      double num2 = 0.0;
      String operand = "";
    }else if(val == '+' || val == '-' || val == 'X' || val == '÷' || val == '%'){
      num1 = double.parse(output);
      operand = val;
      _out = "0";
      output = output+val;
    }else if(val == '.'){
      if(_out.contains(".")){
        return;
      }else{
        _out = _out + val;
      }
    }else if(val == '='){
      num2 = double.parse(output);
      if(operand == "+"){
        _out = (num1+num2).toString();
      }
      if(operand == "-"){
        _out = (num1-num2).toString();
      }
      if(operand == "X"){
        _out = (num1*num2).toString();
      }
      if(operand == "÷"){
        _out = (num1/num2).toString();
      }
      if(operand == "%"){
        _out = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    }
    else if(val == '+/-') {
      output.toString().startsWith('-') ? output = output.toString().substring(1): output = '-'+output.toString();
      _out = output;
    }else{
      _out = _out + val;
    }
    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget CalcBtn(String BtnVal,double size,Color textcolor) {
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (BtnVal.contains('0') ? 2.2 : 1);
    final buttenSize = Size(buttonWidth, squareSideLength);
    return  Expanded(
      flex: BtnVal.contains("0") ? 2:1,
      child: Listener(
        onPointerUp: _onPointerUp,
        onPointerDown: _onPointerDown,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          width: buttenSize.width,
          height: buttenSize.height,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(buttenSize.width),
            color: Colors.grey[300],
            boxShadow: showInnerShadow(),
          ),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttenSize.width),
            ),
            child: Align(
              alignment: Alignment(BtnVal.contains('0') ? -0.8 : 0, 0),
              child: Text(
                BtnVal,
                style: GoogleFonts.montserrat(
                  fontSize: size,
                  fontWeight: FontWeight.w200,
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
                  color: textcolor,
                ),
              ),
            ),
            onPressed: () => PressedButton(BtnVal),
          ),
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
              padding: const EdgeInsets.only(top: 15,bottom: 25,left: 10,right: 10),
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
                padding: EdgeInsets.only(left: 10,right: 10),
                child: AutoSizeText(
                  output,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 30,
                  softWrap: false,
                  style: GoogleFonts.montserrat(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w200,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalcBtn("AC",30.0,Colors.black),
                  CalcBtn("+/-",30.0,Colors.black),
                  CalcBtn("%",30.0,Colors.black),
                  CalcBtn("÷",50.0,kOrange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //add the custom button
                  CalcBtn("7",30.0,Colors.black),
                  CalcBtn("8",30.0,Colors.black),
                  CalcBtn("9",30.0,Colors.black),
                  CalcBtn("X",30.0,kOrange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalcBtn("4",30.0,Colors.black),
                  CalcBtn("5",30.0,Colors.black),
                  CalcBtn("6",30.0,Colors.black),
                  CalcBtn("-",50.0,kOrange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalcBtn("1",30.0,Colors.black),
                  CalcBtn("2",30.0,Colors.black),
                  CalcBtn("3",30.0,Colors.black),
                  CalcBtn("+",50.0,kOrange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalcBtn("0",30.0,Colors.black),
                  CalcBtn(".",50.0,Colors.black),
                  CalcBtn("=",50.0,kOrange),
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

  List<BoxShadow> showInnerShadow1() {
    return [
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
      BoxShadow(
          offset: Offset(3, 3),
          color: Colors.black38,
          blurRadius: 10),
      BoxShadow(
          offset: Offset(-3, -3),
          color: Colors.white.withOpacity(0.85),
          blurRadius: 10),
    ];
  }
}



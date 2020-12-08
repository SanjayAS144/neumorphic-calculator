import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kDarkShadow = Color.fromRGBO(216, 213, 208, 1);
final kOrange = Color.fromRGBO(238, 134, 48, 1);

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String output = "0";

  Stack CalculatorButtons(){
    return Stack(
      children: <Widget>[
        NeuCalculatorButton(text: 'AC'),
        Container(
          child: MaterialButton(
            onPressed: (){
              setState(() {
                output = "1,234";
              });
            },
            splashColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
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
                    margin: EdgeInsets.only(top: 40,bottom: 40),
                    padding: EdgeInsets.only(left: 10,right: 10),
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      output,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 30,
                      softWrap: false,
                      style: GoogleFonts.montserrat(
                        fontSize: 60,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CalculatorButtons(),
                      NeuCalculatorButton(text: '+/-'),
                      NeuCalculatorButton(text: '%'),
                      NeuCalculatorButton(
                        text: '÷',
                        textColor: kOrange,
                        textSize: 50,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NeuCalculatorButton(text: '7'),
                      NeuCalculatorButton(text: '8'),
                      NeuCalculatorButton(text: '9'),
                      NeuCalculatorButton(
                        text: 'x',
                        textColor: kOrange,
                        textSize: 45,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NeuCalculatorButton(text: '4'),
                      NeuCalculatorButton(text: '5'),
                      NeuCalculatorButton(text: '6'),
                      NeuCalculatorButton(
                        text: '-',
                        textColor: kOrange,
                        textSize: 50,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NeuCalculatorButton(text: '1'),
                      NeuCalculatorButton(text: '2'),
                      NeuCalculatorButton(text: '3'),
                      NeuCalculatorButton(
                        text: '+',
                        textColor: kOrange,
                        textSize: 50,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NeuCalculatorButton(
                        text: '0',
                        isPill: true,
                      ),
                      NeuCalculatorButton(
                        text: '.',
                        textSize: 50,
                      ),
                      NeuCalculatorButton(
                        text: '=',
                        textColor: kOrange,
                        textSize: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class NeuCalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final bool isPill;

  const NeuCalculatorButton({
    Key key,
    this.text,
    this.textColor,
    this.textSize,
    this.isPill = false,
  }) : super(key: key);

  @override
  _NeuCalculatorButtonState createState() => _NeuCalculatorButtonState();
}

class _NeuCalculatorButtonState extends State<NeuCalculatorButton> {
  bool _isPressed = false;

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (widget.isPill ? 2.2 : 1);
    final buttenSize = Size(buttonWidth, squareSideLength);
    return SizedBox(
      width: buttenSize.width,
      height: buttenSize.height,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(buttenSize.width),
                color: Colors.grey[300],
                boxShadow: _isPressed ? showInnerShadow() : showShadow(),
              ),
            ),
            Container(
              child: MaterialButton(
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttenSize.width),
                ),
                onPressed: (){
                  setState(() {
                    print(widget.text);
                  });
                },
                child: Align(
                  alignment: Alignment(widget.isPill ? -0.6 : 0, 0),
                  child: Text(
                    widget.text,
                    style: GoogleFonts.montserrat(
                      fontSize: widget.textSize ?? 30,
                      fontWeight: FontWeight.w200,
                      color: widget.textColor ?? Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
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



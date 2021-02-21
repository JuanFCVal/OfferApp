import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonGreen extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  const ButtonGreen(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.width,
      this.height});
  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 1),
                blurRadius: 1.0,
                offset: Offset(0, 3)),
          ],
          /*gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(36, 108, 251, 1),
                  Color.fromRGBO(255, 255, 255, 1)
                ],
                begin: FractionalOffset(1, 0.0),
                end: FractionalOffset(1.0, 3),
                stops: [
                  0.0,
                  11,
                ],
                tileMode: TileMode.clamp)*/
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

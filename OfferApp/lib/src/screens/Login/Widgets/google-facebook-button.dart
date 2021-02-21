import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SocialNetworkButtonLogin extends StatefulWidget {
  final double width;
  final double height;
  final String image;
  final Color colors;
  final VoidCallback onPressed;
  const SocialNetworkButtonLogin(
      {Key key,
      this.colors,
      @required this.image,
      @required this.onPressed,
      this.width,
      this.height});
  @override
  _SocialNetworkButtonLogin createState() => _SocialNetworkButtonLogin();
}

class _SocialNetworkButtonLogin extends State<SocialNetworkButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 1),
              blurRadius: 1.0,
              offset: Offset(0, 3)),
        ],
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: widget.colors,
          ),
          width: widget.width,
          height: widget.height,
          child: Center(
              child: Image.asset(
            widget.image,
            height: this.widget.height / 1.5,
            width: widget.width / 3,
          )),
        ),
      ),
    );
  }
}

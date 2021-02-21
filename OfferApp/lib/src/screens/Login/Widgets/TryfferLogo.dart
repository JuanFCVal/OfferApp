import 'package:flutter/material.dart';

class TryfferLogo extends StatelessWidget {
  final double height, width;
  const TryfferLogo(this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset(
        "assets/img/logotryffer.png",
        fit: BoxFit.fill,
      ),
    );
  }
}

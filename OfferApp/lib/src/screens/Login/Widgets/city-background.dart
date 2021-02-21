import 'package:flutter/material.dart';

class CityBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Image.asset("assets/img/logincity.png",
          fit: BoxFit.fill, height: MediaQuery.of(context).size.height / 4),
    );
  }
}

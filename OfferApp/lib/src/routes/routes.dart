import 'package:OfferApp/src/screens/Home/home.dart';
import 'package:OfferApp/src/screens/Login/login.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'home': (BuildContext context) => Home(),
  };
}

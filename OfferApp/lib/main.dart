import 'package:OfferApp/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tryffer',
      initialRoute: 'home',
      routes: getApplicationRoutes(),
    );
    //home: new BottomNavigation(),
    //  home: LoginScreen());
  }
}

import 'package:OfferApp/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tryffer',
      initialRoute: 'login',
      routes: getApplicationRoutes(),
    );
    //home: new BottomNavigation(),
    //  home: LoginScreen());
  }
}

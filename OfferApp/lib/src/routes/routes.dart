import 'package:OfferApp/src/screens/BussinesList/BussinesList.dart';
import 'package:OfferApp/src/screens/DetalleNegocio/detalle.dart';
import 'package:OfferApp/src/screens/Home/home.dart';
import 'package:OfferApp/src/screens/Login/login.dart';
import 'package:OfferApp/src/screens/ProfielPage/profile.dart';
import 'package:OfferApp/src/screens/ScreenMap/FullMapScreen.dart';
import 'package:OfferApp/src/screens/register/RegisterForm.dart';
import 'package:OfferApp/src/screens/register/register.dart';
import 'package:OfferApp/src/widgets/navbar.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'home': (BuildContext context) => Home(),
    'detalle': (BuildContext context) => detalleNegocio(),
    'ListaNegocios': (BuildContext context) => businessCards(),
    'mapa': (BuildContext context) => FullMapScreen(),
    'profile': (BuildContext context) => ProfilePage(),
    'bottom': (BuildContext context) => BottomNavigation(),
    'register': (BuildContext context) => Register(),
    'regForm': (BuildContext context) => RegisterForm()
  };
}

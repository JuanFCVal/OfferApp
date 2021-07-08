import 'package:OfferApp/src/screens/BussinesList/BussinesList.dart';
import 'package:OfferApp/src/screens/DetalleNegocio/detalle.dart';
import 'package:OfferApp/src/screens/Home/home.dart';
import 'package:OfferApp/src/screens/Login/login.dart';
import 'package:OfferApp/src/screens/ScreenMap/FullMapScreen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginScreen(),
    'home': (BuildContext context) => Home(),
    'detalle': (BuildContext context) => detalleNegocio(),
    'ListaNegocios': (BuildContext context) => businessCards(),
    'mapa': (BuildContext context) => FullMapScreen(),
  };
}

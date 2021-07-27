import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CardSwipper.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoryCard.dart';
import 'package:OfferApp/src/screens/ProfielPage/profile.dart';
import 'package:OfferApp/src/screens/ScreenMap/FullMapScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final OfertasProvider ofertasProvider = new OfertasProvider();

  final CategoriasProvider categoriasProvider = new CategoriasProvider();
  final String selected = "";
  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                width: size.width * 1,
                height: size.height * 0.23,
                child: _cardcategorias()),
            SizedBox(height: 10),
            Text(
              "Sugerencias para ti",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(top: 10), child: _swiperTarjetas()),
          ],
        ),
      ),
    );
  }

  Widget _cardcategorias() {
    return FutureBuilder(
        future: categoriasProvider.getCategorias(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CategoryCards(categorias: snapshot.data);
          } else {
            return Container(
              margin: EdgeInsets.only(top: 100),
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
        future: ofertasProvider.getOfertas(),
        //initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CardSwipper(ofertas: snapshot.data);
          } else {
            return Center(
              child: Container(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

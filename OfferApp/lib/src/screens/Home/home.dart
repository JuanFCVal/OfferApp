import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CardSwipper.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoryCard.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
              width: size.width * 1,
              height: size.height * 0.23,
              child: _CardCategorias()),
          SizedBox(height: 30),
          Text(
            "Sugerencias para ti",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(margin: EdgeInsets.only(top: 20), child: _swiperTarjetas()),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25, right: 15),
        child: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "mapa");
            },
            backgroundColor: Color.fromRGBO(241, 235, 90, 1),
            elevation: 10,
            child: Icon(
              Icons.map,
              color: Color.fromRGBO(89, 214, 58, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _CardCategorias() {
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

import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CardSwipper.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoriesSwiper.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final OfertasProvider ofertasProvider = new OfertasProvider();
  final CategoriasProvider categoriasProvider = new CategoriasProvider();
  final String selected = "";
  @override
  Widget build(context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Color.fromRGBO(243, 243, 243, 1),
                  //width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * 0.55,
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(128, 67, 228, 1),
                ),
              )
            ],
          ),
          Container(
            //IconSearchButton
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.8, top: 50),
            child: IconButton(
                iconSize: 34, icon: Icon(Icons.search), onPressed: () {}),
          ),
          Padding(
            //SwipperTarjetas
            padding: const EdgeInsets.only(
              top: 150,
            ),
            //child: _swiperTarjetas(),
          ),
          Padding(
            //Text Category Selected
            padding: const EdgeInsets.only(top: 180, left: 50),
            child: Text(
              "Recomendaciones",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            //SwipperCategorias
            padding: const EdgeInsets.only(top: 90, left: 40),
            child: _swiperCategorias(),
          ),
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

  Widget _swiperCategorias() {
    return FutureBuilder(
        future: categoriasProvider.getCategorias(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return CategoriesSwiper(categoria: snapshot.data);
          } else {
            return Container(
              margin: EdgeInsets.only(top: 100),
            );
          }
        });
  }
}

import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CardSwipper.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoriesSwiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class Home extends StatelessWidget {
  final MoviesProvider ofertasProvider = new MoviesProvider();
  final CategoriasProvider categoriasProvider = new CategoriasProvider();
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(77, 168, 207, 1),
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_arrow,
        fabColor: Colors.yellow,
        iconColor: Colors.green,
        items: [
          HawkFabMenuItem(
            label: 'Buscar',
            ontap: () {},
            icon: Icon(Icons.search),
            color: Colors.red,
            labelColor: Colors.blue,
          ),
          HawkFabMenuItem(
            label: 'Mapa',
            ontap: () {},
            icon: Icon(Icons.map),
            labelColor: Colors.white,
            labelBackgroundColor: Colors.blue,
          ),
        ],
        body: SingleChildScrollView(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 100,
                  ),
                  AutoSizeText(
                    "Recomendaciones",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 25,
                  ),
                  _swiperTarjetas(),
                  Container(
                    height: 25,
                  ),
                  AutoSizeText(
                    "Categorías",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  _swiperCategorias(),
                  Container(
                    height: 50,
                  ),
                ],
              )
            ],
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
            return Center(
              child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator()),
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
              child: Container(
                margin: EdgeInsets.only(top: 100),
                //child: CircularProgressIndicator()
              ),
            );
          }
        });
  }
}

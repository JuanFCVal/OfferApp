import 'package:OfferApp/src/provider/categorias_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/screens/Home/widgets/CardSwipper.dart';
import 'package:OfferApp/src/screens/Home/widgets/CategoryCard.dart';
import 'package:OfferApp/src/screens/ProfielPage/profile.dart';
import 'package:OfferApp/src/screens/ScreenMap/FullMapScreen.dart';
import 'package:OfferApp/src/services/auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final OfertasProvider ofertasProvider = new OfertasProvider();

  final String selected = "";
  @override
  Widget build(context) {
    final AuthService _auth = AuthService();
    final size = MediaQuery.of(context).size;
    final categoryProv = Provider.of<CategoriasProvider>(context);

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
                child: CategoryCards(
                    categorias: categoryProv.categoriasDisponbles)),
            SizedBox(height: 10),
            Text(
              "Sugerencias para ti",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(top: 10), child: _swiperTarjetas()),
            /* ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('Salir')) */
          ],
        ),
      ),
    );
  }

  /*Widget _cardcategorias() {
    return FutureBuilder(
        future: categoryProv.categoriasDisponbles,
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
*/
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

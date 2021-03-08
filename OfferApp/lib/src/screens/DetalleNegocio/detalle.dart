import 'package:OfferApp/src/model/negocios.dart';
import 'package:OfferApp/src/model/oferta.dart';
import 'package:OfferApp/src/provider/negocios_provider.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';

import 'package:flutter/material.dart';

class detalleNegocio extends StatelessWidget {
  NegociosProvider _negociosProvider = new NegociosProvider();
  OfertasProvider _ofertasProvider = new OfertasProvider();

  Negocio negocio = new Negocio();
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context).settings.arguments;
    index++;
    print(index);

    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  _crearData(index),
                  _crearOfertas(context),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 25, right: 15),
          child: Container(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color.fromRGBO(241, 235, 90, 1),
              elevation: 10,
              child: Icon(
                Icons.directions,
                color: Color.fromRGBO(89, 214, 58, 1),
              ),
            ),
          ),
        ));
  }

  _crearData(int index) {
    return FutureBuilder(
        future: _negociosProvider.getNegocioFromID(index),
        builder: (BuildContext context, AsyncSnapshot<Negocio> snapshot) {
          if (snapshot.hasData) {
            negocio = (snapshot.data);
            print(negocio.descripcion);
            print(negocio.nombre);
            return Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: FadeInImage(
                      placeholder: AssetImage('assets/img/loading.gif'),
                      fit: BoxFit.cover,
                      image: NetworkImage(snapshot.data.getImage())),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 30),
                  child: Container(
                    color: Color.fromRGBO(240, 248, 255, 1),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            negocio.getNombre(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(negocio.getDescription(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal)),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Ofertas",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ]),
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _crearOfertas(BuildContext context) {
    return FutureBuilder(
      future: _ofertasProvider.getOfertas(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: double.maxFinite,
            color: Colors.amber,
            child: ListView(
              children: _crearItems(snapshot.data, context),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  List<Widget> _crearItems(List<Oferta> data, BuildContext context) {
    final List<Widget> ofertas = [];
    print(data);
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element.nombre),
        subtitle: Text(element.descripcion),
      );
      ofertas..add(widgetTemp)..add(Divider());
    });
    return ofertas;
  }
}

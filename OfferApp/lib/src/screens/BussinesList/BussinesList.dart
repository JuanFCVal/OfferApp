import 'package:OfferApp/src/model/categoria.dart';
import 'package:OfferApp/src/provider/negocios_provider.dart';
import 'package:flutter/material.dart';

import 'Widgets/BussinesList.dart';

const _backGroundColor = Colors.lightBlue;

class businessCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Categoria index = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text(index.nombre, style: TextStyle(color: Colors.black))),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: size.height - kToolbarHeight,
                    child: Container(
                      color: Colors.white,
                      child: _BussinesList(index),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _BussinesList(Categoria index) {
    NegociosProvider negociosProvider = new NegociosProvider();
    print(("El index es"));
    print((index.idcategoria));
    return FutureBuilder(
        future: negociosProvider.getNegociosFromCategory(index.idcategoria),
        //initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListaNegocios(negocios: snapshot.data);
          } else {
            return Center(
              child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator()),
            );
          }
        });
  }
}

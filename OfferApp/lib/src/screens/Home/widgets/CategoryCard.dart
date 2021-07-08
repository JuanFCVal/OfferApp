import 'package:OfferApp/src/model/categoria.dart';
import 'package:flutter/material.dart';

class CategoryCards extends StatelessWidget {
  final List<Categoria> categorias;
  final List<Widget> elementos = [];
  CategoryCards({@required this.categorias});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    for (var item in categorias) {
      final card = Container(
        padding: EdgeInsets.all(3),
        width: size.width * 0.40,
        height: size.height * 0.23,
        child: Card(
          semanticContainer: true,
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, "ListaNegocios", arguments: item);
              print("Tapped");
              print(item.nombre);
            },
            title: Container(
              padding: EdgeInsets.only(top: 10, bottom: 3),
              child: CircleAvatar(
                backgroundImage: NetworkImage(item.imgCategoria),
                maxRadius: 40,
              ),
            ),
            subtitle: Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  item.nombre,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      );
      elementos.add(card);
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: elementos,
    );
  }
}

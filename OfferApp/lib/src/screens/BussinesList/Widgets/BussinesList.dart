import 'package:OfferApp/src/model/negocios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListaNegocios extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double spacing;
  final double asepctRatio;
  final List<Negocio> negocios;
  final List<Widget> elementos = [];
  ListaNegocios(
      {@required this.negocios,
      this.itemBuilder,
      this.spacing = 0,
      this.asepctRatio = 0.5});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DualView(
        itemBuilder: (context, index) {
          return BussinesItem(
            bussines: negocios[index],
          );
        },
        itemCount: negocios.length,
        spacing: 30,
        aspectRatio: 0.6,
      ),
    );
  }
}

class BussinesItem extends StatelessWidget {
  final Negocio bussines;
  const BussinesItem({this.bussines});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      shadowColor: Colors.black54,
      child: Column(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              print(bussines.descripcion);
              print(bussines.idnegocio);
              print(bussines.nombre);
              Navigator.pushNamed(context, "detalle", arguments: bussines);
            },
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  bussines.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                child: Text(
                  bussines.nombre,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  bussines.descripcion,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.grey),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ))),
            ],
          ))
        ],
      ),
    );
  }
}

class DualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  DualView(
      {@required this.itemBuilder,
      @required this.itemCount,
      this.spacing = 0,
      this.aspectRatio = 0.5});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      final itemHeight = width * 0.5 / aspectRatio;
      final height = constraints.maxHeight + itemHeight;
      return OverflowBox(
        maxWidth: width,
        minWidth: width,
        minHeight: height,
        maxHeight: height,
        child: GridView.builder(
          padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: spacing,
              childAspectRatio: aspectRatio,
              mainAxisSpacing: spacing),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Transform.translate(
                offset: Offset(0.0, index.isOdd ? itemHeight * 0.5 : 0.0),
                child: itemBuilder(context, index));
          },
        ),
      );
    });
  }
}

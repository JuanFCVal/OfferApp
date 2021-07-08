import 'dart:ui';

import 'package:OfferApp/src/model/negocios.dart';
import 'package:OfferApp/src/model/oferta.dart';
import 'package:OfferApp/src/model/product.dart';
import 'package:OfferApp/src/provider/ofertas_provider.dart';
import 'package:OfferApp/src/provider/products_provider.dart';

import 'package:flutter/material.dart';

class detalleNegocio extends StatefulWidget {
  int indexMap = 0;

  detalleNegocio({this.indexMap});

  @override
  _detalleNegocioState createState() => _detalleNegocioState();
}

class _detalleNegocioState extends State<detalleNegocio> {
  final _pageProductsController = PageController(viewportFraction: 0.60);

  OfertasProvider _ofertasProvider = new OfertasProvider();
  ProductosProvider _productosProvider = new ProductosProvider();

  Negocio negocio = new Negocio();

  @override
  Widget build(BuildContext context) {
    Negocio bussines = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _crearAppBar(bussines),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                _products(context),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _bussinesDataNe(context, bussines),
                ),
                Container(
                    child: IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {
                          print("Touched");
                        }))
              ],
            ),
          ),
        ]))
      ],
    ));
  }

  Widget _crearAppBar(Negocio bussines) {
    return SliverAppBar(
      elevation: 10.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          bussines.nombre,
          style: TextStyle(fontSize: 20),
        ),
        background: Stack(
          children: [
            FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(bussines.logo),
                height: 300,
                width: MediaQuery.of(context).size.width,
                placeholder: AssetImage('assets/loading.gif')),
            Container(
                color: Colors.black.withOpacity(0.2),
                height: 300,
                width: MediaQuery.of(context).size.width),
          ],
        ),
      ),
    );
  }

  Widget _bussinesDataNe(BuildContext context, Negocio bussines) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _crearOfertas(context, bussines),
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Horario de atención",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          Row(
            children: [
              Text(
                bussines.horaApertura.substring(0, 5) + "/",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                bussines.horaCierre.substring(0, 5),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Sobre nosotros",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          Container(
            child: Text(
              bussines.descripcion,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _crearItems(List<Oferta> data, BuildContext context) {
    final List<Widget> ofertas = [];
    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element.nombre),
        subtitle: Text(element.descripcion),
        onTap: () {},
      );
      ofertas..add(widgetTemp)..add(Divider());
    });
    return ofertas;
  }

  _crearOfertas(BuildContext context, Negocio bussines) {
    return FutureBuilder(
      future: _ofertasProvider.getOfertasFromId(int.parse(bussines.idnegocio)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: _crearItems(snapshot.data, context),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _products(BuildContext context) {
    return FutureBuilder(
      future: _productosProvider.getProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Producto> productos = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: _pageProductsController,
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final Producto producto = snapshot.data[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Image.network(
                    producto.imagen,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _productsList(List<Producto> data, BuildContext context) {}
}

import 'package:OfferApp/src/model/negocios.dart';
import 'package:flutter/material.dart';

class AppCoolBar extends StatelessWidget {
  final Negocio negocio;
  AppCoolBar({@required this.negocio});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          negocio.nombre,
          style: TextStyle(fontSize: 20),
        ),
        background: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(negocio.getImage()),
            placeholder: AssetImage('assets/loading.gif')),
      ),
    );
  }
}

import 'package:OfferApp/src/model/oferta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwipper extends StatelessWidget {
  final List<Oferta> ofertas;

  CardSwipper({@required this.ofertas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      //  color: Colors.amber,
      margin: EdgeInsets.only(top: 10),
      child: Swiper(
        itemWidth: _screenSize.width * 0.60,
        itemHeight: _screenSize.height * 0.45,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              fit: BoxFit.cover,
              image: NetworkImage(ofertas[index].getImage()),
            ),
          );
        },
        itemCount: ofertas.length,
        pagination: new SwiperPagination(alignment: Alignment.center),
      ),
    );
  }
}

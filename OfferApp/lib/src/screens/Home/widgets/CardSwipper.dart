import 'package:OfferApp/src/model/oferta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwipper extends StatelessWidget {
  final List<Oferta> ofertas;

  CardSwipper({@required this.ofertas});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Swiper(
      itemWidth: _screenSize.width * 0.50,
      itemHeight: _screenSize.height * 0.6,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "detalle", arguments: index);
          },
          child: Column(
            children: [
              Container(
                width: _screenSize.width * 0.65,
                height: _screenSize.height * 0.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif'),
                    fit: BoxFit.cover,
                    image: NetworkImage(ofertas[index].getImage()),
                  ),
                ),
              ),
              Container(
                height: 19,
              ),
              Text(
                ofertas[index].nombre,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
      itemCount: ofertas.length,
      //pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
    );
  }
}

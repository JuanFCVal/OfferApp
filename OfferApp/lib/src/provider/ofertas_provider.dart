import 'package:OfferApp/src/model/oferta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider {
  Future<List<Oferta>> getOfertas() async {
    final url = "https://tryffer-apirest.herokuapp.com/oferta";
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final ofertas = new Ofertas.fromJsonList(decodedData);
    return ofertas.items;
  }
}

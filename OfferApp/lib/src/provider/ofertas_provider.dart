import 'package:OfferApp/src/model/oferta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OfertasProvider {
  Future<List<Oferta>> getOfertas() async {

    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "oferta");
    final resp = await http.get(ur);

    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final ofertas = new Ofertas.fromJsonList(decodedData);
    return ofertas.items;
  }

  Future<List<Oferta>> getOfertasFromId(int id) async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "negocio/oferta/$id");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final ofertas = new Ofertas.fromJsonList(decodedData);
    return ofertas.items;
  }
}

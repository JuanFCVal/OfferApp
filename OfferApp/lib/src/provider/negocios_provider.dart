import 'package:OfferApp/src/model/negocios.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NegociosProvider {
  Future<List<Negocio>> getNegocios() async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "/negocio");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    final negocios = new Negocios.fromJsonList(decodedData);
    return negocios.items;
  }

  Future<Negocio> getNegocioFromID(int id) async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "/negocio/$id");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    final negocio = new Negocio.fromJsonMap(decodedData[0]);
    return negocio;
  }

  Future<List<Negocio>> getNegociosFromCategory(int id) async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "/categoria/negocio/$id");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    final negocios = new Negocios.fromJsonList(decodedData);
    return negocios.items;
  }
}

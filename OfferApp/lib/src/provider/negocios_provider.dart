import 'package:OfferApp/src/model/negocios.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NegociosProvider {
  Future<List<Negocio>> getNegocios() async {
    final url = "https://tryffer-apirest.herokuapp.com";
    final ur = Uri.http(url, "/negocio");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final negocios = new Negocios.fromJsonList(decodedData);
    return negocios.items;
  }

  Future<Negocio> getNegocioFromID(int id) async {
    final url = "https://tryffer-apirest.herokuapp.com/negocio/$id";
    //final ur = Uri.http(url, "/negocio/$id");
    final resp = await http.get(Uri.parse(url));
    final decodedData = json.decode(resp.body);
    final negocio = new Negocio.fromJsonMap(decodedData[0]);
    return negocio;
  }
}

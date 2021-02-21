import 'package:OfferApp/src/model/categoria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriasProvider {
  Future<List<Categoria>> getCategorias() async {
    final url = "https://tryffer-apirest.herokuapp.com/categoria";
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final categorias = new Categorias.fromJsonList(decodedData);
    return categorias.items;
  }
}

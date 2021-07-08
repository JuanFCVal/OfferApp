import 'package:OfferApp/src/model/categoria.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriasProvider {
  Future<List<Categoria>> getCategorias() async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "categoria");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    final categorias = new Categorias.fromJsonList(decodedData);
    return categorias.items;
  }
}

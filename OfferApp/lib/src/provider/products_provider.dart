import 'package:OfferApp/src/model/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductosProvider {
  Future<List<Producto>> getProducts() async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "producto");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    //print(resp.body);
    final productos = new Productos.fromJsonList(decodedData);
    return productos.items;
  }
}

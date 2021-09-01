import 'package:OfferApp/src/model/categoria.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriasProvider extends ChangeNotifier {
  List<Categoria> categoriasDisponbles = [];
  CategoriasProvider() {
    print("He creado provider");
    getCategorias();
  }

  getCategorias() async {
    final url = "tryffer-apirest.herokuapp.com";
    final ur = Uri.https(url, "categoria");
    final resp = await http.get(ur);
    final decodedData = json.decode(resp.body);
    final categorias = new Categorias.fromJsonList(decodedData);
    this.categoriasDisponbles = categorias.items;
    notifyListeners();
  }
}

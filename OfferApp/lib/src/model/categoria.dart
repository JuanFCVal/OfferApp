// Generated by https://quicktype.io

import 'package:flutter/cupertino.dart';

class Categorias {
  List<Categoria> items = new List();
  Categorias.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final categoria = new Categoria.fromJsonMap(item);
      items.add(categoria);
    }
  }
}

class Categoria {
  int idcategoria;
  String nombre;
  String imgCategoria;
  String descripcion;

  Categoria({
    this.idcategoria,
    this.nombre,
    this.imgCategoria,
    this.descripcion,
  });

  Categoria.fromJsonMap(Map<String, dynamic> json) {
    idcategoria = json["idcategoria"];
    nombre = json["nombre"];
    imgCategoria = json["imgCategoria"];
    descripcion = json["descripcion"];
  }

  getImage() {
    if (imgCategoria == null) {
      return AssetImage("assets/img/no-image.jpg");
    } else {
      return imgCategoria;
    }
  }

  getName() {
    return nombre;
  }
}
import 'package:flutter/cupertino.dart';

class Productos {
  List<Producto> items = [];
  Productos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final producto = new Producto.fromJsonMap(item);
      items.add(producto);
    }
  }
}

class Producto {
  String idproductos;
  String nombre;
  double precio;
  String detalle;
  int disponibilidad;
  String negocioIdnegocio;
  String imagen;

  Producto({
    this.idproductos,
    this.nombre,
    this.precio,
    this.detalle,
    this.disponibilidad,
    this.negocioIdnegocio,
    this.imagen,
  });
  Producto.fromJsonMap(Map<String, dynamic> json) {
    idproductos = json["idproductos"];
    nombre = json["nombre"];
    precio = json["precio"].toDouble();
    detalle = json["detalle"];
    disponibilidad = json["disponibilidad"].toInt();
    negocioIdnegocio = json["negocio_idnegocio"];
    imagen = json["imagen"];
  }
  getImage() {
    if (imagen == null) {
      return AssetImage("assets/img/no-image.jpg");
    } else {
      return imagen;
    }
  }
}

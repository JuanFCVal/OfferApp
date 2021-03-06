import 'package:flutter/cupertino.dart';

class Ofertas {
  List<Oferta> items = [];
  Ofertas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final oferta = new Oferta.fromJsonMap(item);
      items.add(oferta);
    }
  }
}

class Oferta {
  String idofertas;
  String fechaInicio;
  String fechaFin;
  String nombre;
  String descripcion;
  int repiteSemanal;
  int repiteMensual;
  String productoIdproductos;
  String imagen;

  Oferta({
    this.idofertas,
    this.fechaInicio,
    this.fechaFin,
    this.nombre,
    this.descripcion,
    this.repiteSemanal,
    this.repiteMensual,
    this.productoIdproductos,
    this.imagen,
  });

  Oferta.fromJsonMap(Map<String, dynamic> json) {
    idofertas = json["idofertas"];
    fechaInicio = json["fechaInicio"];
    fechaFin = json["fechaFin"];
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    repiteSemanal = json["repiteSemanal"];
    repiteMensual = json["repiteMensual"];
    productoIdproductos = json["producto_idproductos"];
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

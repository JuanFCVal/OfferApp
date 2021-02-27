import 'package:flutter/cupertino.dart';

class Ofertas {
  List<Oferta> items = new List();
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
  String incentivo;
  int repiteSemanal;
  int repiteMensual;
  String productoIdproductos;
  String imagen;
  String negocioID;

  Oferta(
      {this.idofertas,
      this.fechaInicio,
      this.fechaFin,
      this.nombre,
      this.descripcion,
      this.incentivo,
      this.repiteSemanal,
      this.repiteMensual,
      this.productoIdproductos,
      this.imagen,
      this.negocioID});

  Oferta.fromJsonMap(Map<String, dynamic> json) {
    idofertas = json["idofertas"];
    fechaInicio = json["fechaInicio"];
    fechaFin = json["fechaFin"];
    nombre = json["nombre"];
    descripcion = json["descripcion"];
    incentivo = json["incentivo"];
    repiteSemanal = json["repiteSemanal"];
    repiteMensual = json["repiteMensual"];
    productoIdproductos = json["producto_idproductos"];
    imagen = json["imagen"];
    negocioID = json["negocioID"];
  }

  getImage() {
    if (imagen == null) {
      return AssetImage("assets/img/no-image.jpg");
    } else {
      return imagen;
    }
  }
}

// To parse this JSON data, do
//
//     final distancia = distanciaFromJson(jsonString);

import 'dart:convert';

List<Distancia> distanciaFromJson(String str) =>
    List<Distancia>.from(json.decode(str).map((x) => Distancia.fromJson(x)));

String distanciaToJson(List<Distancia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Distancia {
  Distancia({
    this.idubicacion,
    this.negocioIdnegocio,
    this.referencia,
    this.latitud,
    this.longitud,
  });

  int idubicacion;
  String negocioIdnegocio;
  String referencia;
  double latitud;
  double longitud;

  factory Distancia.fromJson(Map<String, dynamic> json) => Distancia(
        idubicacion: json["idubicacion"],
        negocioIdnegocio: json["negocio_idnegocio"],
        referencia: json["referencia"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "idubicacion": idubicacion,
        "negocio_idnegocio": negocioIdnegocio,
        "referencia": referencia,
        "latitud": latitud,
        "longitud": longitud,
      };
}

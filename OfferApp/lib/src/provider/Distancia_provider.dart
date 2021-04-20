import 'package:OfferApp/src/model/Distancia.dart';
import 'package:http/http.dart' as http;

class DistanciaProvider {
  static Future<List<Distancia>> getLatlng() async {
    final url = "https://tryffer-apirest.herokuapp.com";
    final ur = Uri.http(url, "/ubicacion");
    try {
      final response = await http.get(ur);
      if (response.statusCode == 200) {
        final List<Distancia> distancia = distanciaFromJson(response.body);
        return distancia;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

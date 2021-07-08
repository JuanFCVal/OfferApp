import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(
      {this.startLng, this.startLat, this.endLng, this.endLat, this.pathParam});

  final String url = 'https://api.openrouteservice.org';
  final String apiKey =
      '5b3ce3597851110001cf6248b40b0df3ac7844049ac8200e48bb0bd3';
  final String pathParam; // Change it if you want
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async {
    var ur = url +
        '/v2/directions/$pathParam?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat';
    http.Response response = await http.get(Uri.parse(ur));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

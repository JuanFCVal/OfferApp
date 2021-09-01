import 'package:OfferApp/src/model/Distancia.dart';
import 'package:OfferApp/src/model/negocios.dart';
import 'package:OfferApp/src/provider/Distancia_provider.dart';
import 'package:OfferApp/src/provider/negocios_provider.dart';
import 'package:OfferApp/src/screens/DetalleNegocio/detalle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'NetworkHelper.dart';

class FullMapScreen extends StatefulWidget {
  @override
  _FullMapScreenState createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  GoogleMapController mapController;

  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {}; // For holding instance of Polyline
  final Set<Marker> markers = {}; // For holding instance of Marker
  var data;
  var dataBytes;
  var center = LatLng(-4.000402, -79.201912);
  List<Distancia> _geoloc = [];
  Negocio _negocio = new Negocio();
  bool isVisible;
  bool text1 = false;
  bool isButtonVisible;
  var pathParam;
  NegociosProvider _negociosProvider = new NegociosProvider();
  detalleNegocio detalleNegocioq;

  // Dummy Start and Destination Points
  double startLat = 0;
  double startLng = 0;
  double endLat = 0;
  double endLng = 0;
  double miLatitud = 0;
  double miLongitud = 0;
  var distancia;
  var tiempo;
  var cociente;
  var medio;
  int idMarker;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setMarkers() async {
    for (int i = 0; i < _geoloc.length; i++) {
      Distancia dist = _geoloc[i];
      _negociosProvider
          .getNegocioFromID(int.parse(dist.negocioIdnegocio))
          .then((negocio) {
        setState(() {
          _negocio = negocio;
          markers.add(Marker(
            markerId: MarkerId(dist.idubicacion.toString()),
            position: LatLng(dist.latitud, dist.longitud),
            infoWindow: InfoWindow(
                title: _negocio.nombre,
                snippet: 'Más información',
                onTap: () {
                  Navigator.pushNamed(context, "detalle", arguments: _negocio);
                }),
            onTap: () {
              setState(() {
                isButtonVisible = true;
                endLat = dist.latitud;
                endLng = dist.longitud;
              });
            },
          ));
        });
      });
      setState(() {});
    }
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      miLatitud = geoposition.latitude;
      miLongitud = geoposition.longitude;
      center = LatLng(miLatitud, miLongitud);
      startLat = miLatitud;
      startLng = miLongitud;
    });
  }

  void getJsonData() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    NetworkHelper network = NetworkHelper(
      startLat: startLat,
      startLng: startLng,
      endLat: endLat,
      endLng: endLng,
      pathParam: pathParam,
    );

    try {
      // getData() returns a json Decoded data
      data = await network.getData();

      // We can reach to our desired JSON data manually as following
      LineString ls =
          LineString(data['features'][0]['geometry']['coordinates']);

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
    } catch (e) {
      print(e);
    }
  }

  void getDistance() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    NetworkHelper network = NetworkHelper(
      startLat: startLat,
      startLng: startLng,
      endLat: endLat,
      endLng: endLng,
      pathParam: pathParam,
    );

    try {
      // getData() returns a json Decoded data
      data = await network.getData();

      // We can reach to our desired JSON data manually as following
      if (data != null) {
        setState(() {
          distancia = ((data['features'][0]['properties']['summary']
                      ['distance']) /
                  1000)
              .toStringAsFixed(3);
          cociente =
              ((data['features'][0]['properties']['summary']['duration']) % 60)
                  .toInt();
          tiempo =
              ((data['features'][0]['properties']['summary']['duration']) / 60)
                  .toInt();
        });
        print('minutos: $tiempo, segundos: $cociente');
      }
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polyLines.add(polyline);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pathParam = '';
    DistanciaProvider.getLatlng().then((geoloc) {
      setState(() {
        _geoloc = geoloc;
        setMarkers();
      });
    });
    getCurrentLocation();
    isVisible = false;
    idMarker = 0;
    distancia = 0;
    tiempo = 0;
    cociente = 0;
    medio = '';
    isButtonVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 15,
                ),
                markers: markers,
                polylines: polyLines,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapToolbarEnabled: false,
                onTap: (latlng) {
                  setState(() {
                    isButtonVisible = false;
                  });
                }),
            Align(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Visibility(
                        visible: isVisible,
                        child: FloatingActionButton(
                            child: Icon(Icons.arrow_back_outlined),
                            onPressed: () {
                              setState(() {
                                polyPoints.length = 0;
                                isVisible = false;
                                isButtonVisible = false;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FloatingActionButton(
                          child: Icon(Icons.my_location),
                          onPressed: () {
                            mapController.animateCamera(
                                CameraUpdate.newLatLngZoom(
                                    LatLng(miLatitud, miLongitud), 16));
                            print(miLatitud);
                            print(miLongitud);
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Visibility(
                    visible: isButtonVisible,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            polyPoints.length = 0;
                            setState(() {
                              isVisible = true;
                              pathParam = 'driving-car';
                              medio = 'Manejando';
                            });
                            getDistance();
                            getJsonData();
                            setState(() {});
                          },
                          child: Icon(Icons.directions_car),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            polyPoints.length = 0;
                            setState(() {
                              isVisible = true;
                              pathParam = 'foot-walking';
                              medio = 'Caminando';
                            });
                            getDistance();
                            getJsonData();
                            setState(() {});
                          },
                          child: Icon(Icons.directions_walk),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            polyPoints.length = 0;
                            setState(() {
                              isVisible = true;
                              pathParam = 'cycling-regular';
                              medio = 'Bicicleta';
                            });
                            getDistance();
                            getJsonData();
                            setState(() {});
                          },
                          child: Icon(Icons.directions_bike),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Visibility(
                        visible: isVisible,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Ruta de llegada',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'MEDIO: $medio\nDISTANCIA: $distancia km\nDURACIÓN: $tiempo mins $cociente seg',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
  double kilometros;
}

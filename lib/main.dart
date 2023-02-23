import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Leaflet Map'),
        ),
        body: MyMap(),
      ),
    );
  }
}

LatLng locationCoordinates = LatLng(34.0560271,-6.8091905);

Marker locationMarker = Marker(
  width: 40.0,
  height: 40.0,
  point: locationCoordinates,
  builder: (context) => Container(
    child: Icon(
      Icons.location_on,
      color: Colors.red,
      size: 35.0,
    ),
  ),
);

class MyMap extends StatelessWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(34.0560271,-6.8091905),
          zoom: 13,

        ),

        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [locationMarker],
          )
        ],
      ),

    );

  }
}



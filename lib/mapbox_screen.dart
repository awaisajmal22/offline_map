import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart' show rootBundle;

class S57S52MapPage extends StatefulWidget {
  @override
  _S57S52MapPageState createState() => _S57S52MapPageState();
}

class _S57S52MapPageState extends State<S57S52MapPage> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  Future<void> loadGeoJsonData() async {
    final data = await rootBundle.loadString('assets/map/map.geojson');
    // Here you can parse the GeoJSON data with the GeoJson widget
    setState(() {
      geoJsonData = data;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('S57 and S52 in Flutter')),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(51.5, -0.09),
          zoom: 5,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          // GeoJson layer that adds the parsed GeoJSON data to the map
          GeoJson(
            geoJson: geoJsonData, // The parsed GeoJSON data
            markerBuilder: (latLng, properties) {
              return Marker(
                point: latLng,
                builder: (ctx) => Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 30,
                ),
              );
            },
            polylineBuilder: (points, properties) {
              return Polyline(
                points: points,
                color: properties.containsKey('color')
                    ? Color(int.parse(properties['color']))
                    : Colors.blue,
                strokeWidth: 3.0,
              );
            },
            polygonBuilder: (points, holes, properties) {
              return Polygon(
                points: points,
                color: Colors.green.withOpacity(0.3),
                borderColor: Colors.green,
                borderStrokeWidth: 2.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
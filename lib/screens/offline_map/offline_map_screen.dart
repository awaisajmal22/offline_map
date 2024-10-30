import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:offline_map/constant/constant.dart';

class OfflineMapScreen extends StatelessWidget {
  const OfflineMapScreen({super.key});
  Future<void> addOfflineGeoJsonLayer(MapboxMapController controller) async {
  // Load GeoJSON file from assets
  final geojsonString = await rootBundle.loadString('assets/map/DEPARE.geojson');
  final geojson = json.decode(geojsonString);

  // Add GeoJSON source
  await controller.addSource(
    's57-offline-source',
    GeojsonSourceProperties(data: geojson),
  );

  // Style the layer
  await controller.addLayer(
    's57-offline-layer',
    's57-offline-source',
    LineLayerProperties(lineColor: "#FF0000", lineWidth: 2.0),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken: Constant.accessTokenMapBox,
  onMapCreated: (MapboxMapController controller) async {
    // await downloadOfflineRegion(controller);
    await addOfflineGeoJsonLayer(controller); 
  },
  initialCameraPosition: CameraPosition(
    target: LatLng(37.7749, -122.4194), 
    zoom: 12,
  ),
  styleString: MapboxStyles.MAPBOX_STREETS,
),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:latlong2/latlong.dart';
// ignore: depend_on_referenced_packages
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:provider/provider.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<LatLng> tappedPoints = [
      (context.watch<GetTappedPoints>().getTappedPoints)
    ];

    String explosionPower =
        context.watch<GetExplosionPower>().getExplosionPower.toStringAsFixed(0);
    double widtA = context.watch<GetWidthA>().getWidthA;
    double deptA = context.watch<GetDepthA>().getDepthA;
    double widtB = context.watch<GetWidthB>().getWidthB;
    double deptB = context.watch<GetDepthB>().getDepthB;
    double widtV = context.watch<GetWidthV>().getWidthV;
    double deptV = context.watch<GetDepthV>().getDepthV;
    double widtG = context.watch<GetWidthG>().getWidthG;
    double deptG = context.watch<GetDepthG>().getDepthG;
    double fireBall = context.watch<GetFireBall>().getFireBall;
    double overpressure20 =
        context.watch<GetOverpressure20>().getOverpressure20;
    double overpressure10 =
        context.watch<GetOverpressure10>().getOverpressure10;
    double overpressure5 = context.watch<GetOverpressure5>().getOverpressure5;
    double overpressure1 = context.watch<GetOverpressure1>().getOverpressure1;
    double thermalRadiation1 =
        context.watch<GetThermalRadiation1>().getThermalRadiation1;
    double thermalRadiation2 =
        context.watch<GetThermalRadiation2>().getThermalRadiation2;
    double thermalRadiation3 =
        context.watch<GetThermalRadiation3>().getThermalRadiation3;
    double ionizingRadiation500 =
        context.watch<GetIonizingRadiation500>().getIonizingRadiation500;
    double ionizingRadiation100 =
        context.watch<GetIonizingRadiation100>().getIonizingRadiation100;

    final markers = tappedPoints.map((latlng) {
      return Marker(
        width: 60,
        height: 40,
        point: latlng,
        builder: (ctx) => GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
              duration: const Duration(seconds: 15),
              backgroundColor: Colors.blue,
              content: Text(
                "Потужність: $explosionPower кілотон, \nЗона А: глибина - ${deptA.toStringAsFixed(0)} км, ширина - ${widtA.toStringAsFixed(0)} км \nЗона Б: глибина - ${deptB.toStringAsFixed(0)} км, ширина ${widtB.toStringAsFixed(0)} - км \nЗона В: глибина - ${deptV.toStringAsFixed(0)} км, ширина - ${widtV.toStringAsFixed(0)} км \nЗона Г: глибина - ${deptG.toStringAsFixed(0)} км, ширина - ${widtG.toStringAsFixed(0)} км",
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 13,
                ),
              ),
            ));
          },
          child: const Icon(
            Icons.center_focus_weak,
            color: Colors.black,
            size: 40,
          ),
        ),
      );
    }).toList();

    var x = double.parse(tappedPoints.map((e) => e.latitude).join());
    var y = double.parse(tappedPoints.map((e) => e.longitude).join());

    double directionWind = context.watch<GetWindDirection>().getWindDirection;
    double lat = x;
    double lng = y;

    cloudeA() {
      double widthA = widtA / 2;
      double depthA = deptA;
      double thermalRadiation33 =
          context.watch<GetThermalRadiation3>().getThermalRadiation3;
      double? latOne;
      double? lngOne;
      double? latStepOne;
      double? lngStepOne;
      double? latStepTwo;
      double? lngStepTwo;
      List<LatLng> result = [];

      if (depthA == 0) {
        latOne = lat;
        lngOne = lng;
        result.add(LatLng(latOne, lngOne));
      } else {
        latStepOne = lat +
            ((((widthA - thermalRadiation33) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepOne = lng +
            (widthA - thermalRadiation33) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);
        latStepTwo = lat +
            ((((depthA - (widthA / 6)) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepTwo = lng +
            (depthA - (widthA / 6)) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);

        for (var i = -90; i <= 90; i++) {
          latOne = latStepTwo +
              (((widthA / 6) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepTwo +
              ((widthA / 6) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }

        for (var i = 90; i <= 270; i++) {
          latOne = latStepOne +
              (((widthA) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepOne +
              ((widthA) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }
      }
      return result;
    }

    cloudeB() {
      double widthB = widtB / 2;
      double depthB = deptB;
      double overpressure5 = context.watch<GetOverpressure5>().getOverpressure5;
      double? latOne;
      double? lngOne;
      double? latStepOne;
      double? lngStepOne;
      double? latStepTwo;
      double? lngStepTwo;
      List<LatLng> result = [];

      if (depthB == 0) {
        latOne = lat;
        lngOne = lng;
        result.add(LatLng(latOne, lngOne));
      } else {
        latStepOne = lat +
            ((((widthB - overpressure5) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepOne = lng +
            (widthB - overpressure5) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);
        latStepTwo = lat +
            ((((depthB - (widthB / 6)) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepTwo = lng +
            (depthB - (widthB / 6)) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);

        for (var i = -90; i <= 90; i++) {
          latOne = latStepTwo +
              (((widthB / 6) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepTwo +
              ((widthB / 6) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }

        for (var i = 90; i <= 270; i++) {
          latOne = latStepOne +
              (((widthB) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepOne +
              ((widthB) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }
      }
      return result;
    }

    cloudeV() {
      double widthV = widtV / 2;
      double depthV = deptV;
      double overpressure10 =
          context.watch<GetOverpressure10>().getOverpressure10;
      double? latOne;
      double? lngOne;
      double? latStepOne;
      double? lngStepOne;
      double? latStepTwo;
      double? lngStepTwo;
      List<LatLng> result = [];

      if (depthV == 0) {
        latOne = lat;
        lngOne = lng;
        result.add(LatLng(latOne, lngOne));
      } else {
        latStepOne = lat +
            ((((widthV - overpressure10) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepOne = lng +
            (widthV - overpressure10) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);
        latStepTwo = lat +
            ((((depthV - (widthV / 6)) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepTwo = lng +
            (depthV - (widthV / 6)) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);

        for (var i = -90; i <= 90; i++) {
          latOne = latStepTwo +
              (((widthV / 6) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepTwo +
              ((widthV / 6) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }

        for (var i = 90; i <= 270; i++) {
          latOne = latStepOne +
              (((widthV) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepOne +
              ((widthV) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }
      }
      return result;
    }

    cloudeG() {
      double widthG = widtG / 2;
      double depthG = deptG;

      double? latOne;
      double? lngOne;
      double? latStepOne;
      double? lngStepOne;
      double? latStepTwo;
      double? lngStepTwo;
      List<LatLng> result = [];

      if (depthG == 0) {
        latOne = lat;
        lngOne = lng;
        result.add(LatLng(latOne, lngOne));
      } else {
        latStepOne = lat +
            ((((widthG - fireBall) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepOne = lng +
            (widthG - fireBall) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);
        latStepTwo = lat +
            ((((depthG - (widthG / 2)) * 1000) *
                    cos((360 + directionWind) * 3.1415 / 180)) /
                (6371000 * 3.1415 / 180));
        lngStepTwo = lng +
            (depthG - (widthG / 2)) *
                1000 *
                sin((360 + directionWind) * 3.1415 / 180) /
                cos(lat * 3.1415 / 180) /
                (6371000 * 3.1415 / 180);

        for (var i = -90; i <= 90; i++) {
          latOne = latStepTwo +
              (((widthG / 2) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepTwo +
              ((widthG / 2) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }

        for (var i = 90; i <= 270; i++) {
          latOne = latStepOne +
              (((widthG) * 1000 * cos((i + directionWind) * 3.1415 / 180)) /
                  (6371000 * 3.1415 / 180));
          lngOne = lngStepOne +
              ((widthG) *
                  1000 *
                  sin((i + directionWind) * 3.1415 / 180) /
                  cos(lat * 3.1415 / 180) /
                  (6371000 * 3.1415 / 180));
          result.add(LatLng(latOne, lngOne));
        }
      }
      return result;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Прогноз наслідків ЯВ'),
      ),
      drawer: buildDrawer(context, route),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Координати: ${x.toStringAsFixed(3)},  ${y.toStringAsFixed(3)}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                    center: LatLng(x, y),
                    zoom: 5,
                    rotation: 0,
                    onTap: (TapPosition tapPosition, LatLng latlng) {
                      context
                          .read<GetTappedPoints>()
                          .changeTappedPoints(latlng);
                    }),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  PolygonLayer(polygons: [
                    Polygon(
                      points: cloudeA(),
                      label: 'Зона А',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 1, 26, 255),
                        fontSize: 10,
                        backgroundColor: Color.fromARGB(164, 255, 255, 255),
                      ),
                      labelPlacement: PolygonLabelPlacement.centroid,
                      isFilled: true, // By default it's false
                      borderColor: const Color.fromARGB(255, 2, 24, 224),
                      borderStrokeWidth: 3,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                    Polygon(
                      points: cloudeB(),
                      label: 'Зона Б',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 8, 102, 11),
                        fontSize: 10,
                        backgroundColor: Color.fromARGB(164, 255, 255, 255),
                      ),
                      labelPlacement: PolygonLabelPlacement.centroid,
                      isFilled: true,
                      borderColor: const Color.fromARGB(255, 0, 167, 50),
                      borderStrokeWidth: 3,
                      color: Colors.green.withOpacity(0.2),
                    ),
                    Polygon(
                      points: cloudeV(),
                      label: 'Зона B',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 107, 0, 0),
                        fontSize: 10,
                        backgroundColor: Color.fromARGB(164, 255, 255, 255),
                      ),
                      labelPlacement: PolygonLabelPlacement.centroid,
                      isFilled: true,
                      borderColor: const Color.fromARGB(255, 255, 0, 0),
                      borderStrokeWidth: 3,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    Polygon(
                      points: cloudeG(),
                      label: 'Зона Г',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        backgroundColor: Color.fromARGB(164, 255, 255, 255),
                      ),
                      labelPlacement: PolygonLabelPlacement.centroid,
                      isFilled: true,
                      borderColor: const Color.fromARGB(255, 0, 0, 0),
                      borderStrokeWidth: 3,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ]),
                  CircleLayer(circles: [
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 255, 0, 0),
                      point: LatLng(x, y),
                      color: Colors.red.withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: fireBall * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 201, 1, 1),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: overpressure20 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 153, 1, 1),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: overpressure10 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 112, 1, 1),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: overpressure5 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 87, 1, 1),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: overpressure1 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 1, 100, 5),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: thermalRadiation1 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 3, 187, 12),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: thermalRadiation2 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 0, 255, 13),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: thermalRadiation3 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 6, 10, 245),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: ionizingRadiation500 * 1000,
                    ),
                    CircleMarker(
                      borderColor: const Color.fromARGB(255, 94, 7, 255),
                      point: LatLng(x, y),
                      color: const Color.fromARGB(255, 210, 247, 5)
                          .withOpacity(0.0),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: ionizingRadiation100 * 1000,
                    ),
                  ]),
                  MarkerLayer(markers: markers),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

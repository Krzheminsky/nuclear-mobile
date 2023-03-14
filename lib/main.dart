import 'package:flutter/material.dart';
import 'package:nuclear/pagets/about.dart';
import 'package:nuclear/pagets/get_weather.dart';
import 'package:nuclear/pagets/light_radiation.dart';
import 'package:nuclear/pagets/penetrating_radiation.dart';
import 'package:nuclear/pagets/radioactive_contamination.dart';
import 'package:nuclear/pagets/shock_wave.dart';

import 'package:provider/provider.dart';
import 'calculate/data_calculate.dart';

import 'package:nuclear/pagets/home.dart';
import 'package:nuclear/pagets/add_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetTappedPoints>(
          create: (context) => GetTappedPoints(),
        ),
        ChangeNotifierProvider<GetWindDirection>(
          create: (context) => GetWindDirection(),
        ),
        ChangeNotifierProvider<GetWindSpeed>(
          create: (context) => GetWindSpeed(),
        ),
        ChangeNotifierProvider<GetExplosionPower>(
          create: (context) => GetExplosionPower(),
        ),
        ChangeNotifierProvider<GetTypeOfExplosion>(
          create: (context) => GetTypeOfExplosion(),
        ),
        ChangeNotifierProvider<GetFireBall>(
          create: (context) => GetFireBall(),
        ),
        ChangeNotifierProvider<GetOverpressure20>(
          create: (context) => GetOverpressure20(),
        ),
        ChangeNotifierProvider<GetOverpressure10>(
          create: (context) => GetOverpressure10(),
        ),
        ChangeNotifierProvider<GetOverpressure5>(
          create: (context) => GetOverpressure5(),
        ),
        ChangeNotifierProvider<GetOverpressure1>(
          create: (context) => GetOverpressure1(),
        ),
        ChangeNotifierProvider<GetThermalRadiation1>(
          create: (context) => GetThermalRadiation1(),
        ),
        ChangeNotifierProvider<GetThermalRadiation2>(
          create: (context) => GetThermalRadiation2(),
        ),
        ChangeNotifierProvider<GetThermalRadiation3>(
          create: (context) => GetThermalRadiation3(),
        ),
        ChangeNotifierProvider<GetIonizingRadiation500>(
          create: (context) => GetIonizingRadiation500(),
        ),
        ChangeNotifierProvider<GetIonizingRadiation100>(
          create: (context) => GetIonizingRadiation100(),
        ),
        ChangeNotifierProvider<GetDepthA>(
          create: (context) => GetDepthA(),
        ),
        ChangeNotifierProvider<GetWidthA>(
          create: (context) => GetWidthA(),
        ),
        ChangeNotifierProvider<GetDepthB>(
          create: (context) => GetDepthB(),
        ),
        ChangeNotifierProvider<GetWidthB>(
          create: (context) => GetWidthB(),
        ),
        ChangeNotifierProvider<GetDepthV>(
          create: (context) => GetDepthV(),
        ),
        ChangeNotifierProvider<GetWidthV>(
          create: (context) => GetWidthV(),
        ),
        ChangeNotifierProvider<GetDepthG>(
          create: (context) => GetDepthG(),
        ),
        ChangeNotifierProvider<GetWidthG>(
          create: (context) => GetWidthG(),
        ),
        ChangeNotifierProvider<GetZoom>(
          create: (context) => GetZoom(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NuclearSimulation',
          home: const HomePage(),
          routes: <String, WidgetBuilder>{
            AddData.route: (context) => AddData(),
            GetWeather.route: (context) => GetWeather(),
            ShockWave.route: (context) => const ShockWave(),
            LightRadiation.route: (context) => const LightRadiation(),
            PenetratingRadiation.route: (context) =>
                const PenetratingRadiation(),
            RadioactiveContamination.route: (context) =>
                const RadioactiveContamination(),
            About.route: (context) => const About(),
          }),
    );
  }
}

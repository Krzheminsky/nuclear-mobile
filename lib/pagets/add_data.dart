// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddData extends StatelessWidget {
  static const String route = 'AddData';
  AddData({super.key});

  var typeOfExplosion = [
    'Наземний',
    'Повітряний',
  ];

  @override
  Widget build(BuildContext context) {
    String StartEmountRadiation =
        context.watch<GetExplosionPower>().getExplosionPower.toStringAsFixed(0);
    String StartWindSpeed =
        context.watch<GetWindSpeed>().getWindSpeed.toStringAsFixed(2);

    double fireBall = 0;
    double overpressure20 = 0;
    double overpressure10 = 0;
    double overpressure5 = 0;
    double overpressure1 = 0;
    double thermalRadiation1 = 0;
    double thermalRadiation2 = 0;
    double thermalRadiation3 = 0;
    double ionizingRadiation500 = 0;
    double ionizingRadiation100 = 0;
    double depthA = 0;
    double widthA = 0;
    double depthB = 0;
    double widthB = 0;
    double depthV = 0;
    double widthV = 0;
    double depthG = 0;
    double widthG = 0;
    String typeExplosion =
        context.watch<GetTypeOfExplosion>().getTypeOfExplosion;
    double power = context.watch<GetExplosionPower>().getExplosionPower;
    double wind = context.watch<GetWindSpeed>().getWindSpeed;

    nuclearExplosion() {
      if (typeExplosion == 'Наземний') {
        fireBall = (0.0813 * pow(power, 0.3956));
      } else {
        fireBall = (0.0592 * pow(power, 0.4045));
      }

      if (typeExplosion == 'Наземний') {
        overpressure20 = (0.2187 * pow(power, 0.3327));
      } else if (power >= 15) {
        overpressure20 = (0.2273 * pow(power, 0.3327));
      } else {
        overpressure20 = 0;
      }

      if (typeExplosion == 'Наземний') {
        overpressure10 = (0.3096 * pow(power, 0.3347));
      } else if (power >= 0.5) {
        overpressure10 = (0.274 * pow(power, 0.3609));
      } else {
        overpressure10 = 0;
      }

      if (typeExplosion == 'Наземний') {
        overpressure5 = (0.4559 * pow(power, 0.334));
      } else if (power >= 0.5) {
        overpressure5 = (0.4891 * pow(power, 0.342));
      } else {
        overpressure5 = 0;
      }

      if (typeExplosion == 'Наземний') {
        overpressure1 = (1.1768 * pow(power, 0.3333));
      } else if (power >= 0.3) {
        overpressure1 = (1.8689 * pow(power, 0.2896));
      } else {
        overpressure1 = 0;
      }

      if (typeExplosion == 'Наземний') {
        thermalRadiation1 = (1.0551 * pow(power, 0.4103));
      } else if (power >= 0.3) {
        thermalRadiation1 = (1.1248 * pow(power, 0.4246));
      } else {
        thermalRadiation1 = 0;
      }

      if (typeExplosion == 'Наземний') {
        thermalRadiation2 = (0.7414 * pow(power, 0.4181));
      } else if (power >= 0.3) {
        thermalRadiation2 = (0.6635 * pow(power, 0.4571));
      } else {
        thermalRadiation2 = 0;
      }

      if (typeExplosion == 'Наземний') {
        thermalRadiation3 = (0.5658 * pow(power, 0.4185));
      } else if (power >= 0.5) {
        thermalRadiation3 = (0.5758 * pow(power, 0.4381));
      } else {
        thermalRadiation3 = 0;
      }

      if (typeExplosion == 'Наземний') {
        ionizingRadiation500 = (0.8328 * pow(power, 0.1656));
      } else if (power >= 0.3) {
        ionizingRadiation500 = (0.7253 * pow(power, 0.1804));
      } else {
        ionizingRadiation500 = 0;
      }

      if (typeExplosion == 'Наземний') {
        ionizingRadiation100 = (1.1067 * pow(power, 0.1449));
      } else {
        ionizingRadiation100 = (0.9645 * pow(power, 0.1626));
      }

      // depthA

      if (typeExplosion == 'Наземний') {
        if (power < 0.1 && wind <= 50) {
          depthA = (((-0.0002 * pow(wind, 2)) + (wind * 0.018) + 0.682) *
              ((-224.68 * pow(power, 2)) + (62.928 * power) + 0.4484));
        } else if ((power >= 0.1 && power <= 0.5) && wind <= 50) {
          depthA = (((-0.0002 * pow(wind, 2)) + (wind * 0.0248) + 0.5351) *
              ((-15.833 * pow(power, 2)) + (22.75 * power) + 2.3833));
        } else if ((power > 0.5 && power <= 5) && wind <= 75) {
          depthA = (((2e-06 * pow(wind, 3)) -
                  (0.0004 * pow(wind, 2)) +
                  (wind * 0.0288) +
                  0.4772) *
              ((-0.482 * pow(power, 2)) + (7.2812 * power) + 6.6225));
        } else if (power > 5 && power <= 100) {
          depthA = (((-8e-05 * pow(wind, 2)) + (wind * 0.0181) + 0.5594) *
              ((-0.0059 * pow(power, 2)) + (1.6953 * power) + 24.244));
        } else if (power > 100 && power <= 1000) {
          depthA = (((-8e-05 * pow(wind, 2)) + (wind * 0.0181) + 0.5594) *
              ((-0.0003 * pow(power, 2)) + (0.5834 * power) + 84.208));
        } else if (power > 1000 && power <= 10000) {
          depthA = ((0.3859 * log(wind) - 0.2432) *
              ((-5e-06 * pow(power, 2)) + (0.1251 * power) + 244.31));
        } else if (power > 10000) {
          depthA =
              (((0.0729 * wind / 3.6) + 1.0619) * 27.223 * pow(power, 0.305));
        } else {
          depthA = 0;
        }
      } else if (typeExplosion == 'Повітряний') {
        if (power < 0.05) {
          depthA = 0;
        } else if ((power >= 0.05 && power < 0.1) &&
            (wind >= 10 && wind <= 18)) {
          depthA = 1.1;
        } else if ((power >= 0.05 && power < 0.1) &&
            (wind >= 19 && wind <= 25)) {
          depthA = 1;
        } else if ((power >= 0.1 && power <= 0.5) && wind <= 50) {
          depthA =
              ((0.0097 * log(wind) + 0.8781) * (1.566 * log(power) + 5.5257));
        } else if ((power > 0.5 && power <= 5) && wind <= 75) {
          depthA =
              ((0.1763 * log(wind) + 0.4015) * (4.0928 * log(power) + 6.7782));
        } else if (power > 5 && power <= 100) {
          depthA =
              ((0.3226 * log(wind) - 0.0252) * (19.033 * log(power) - 27.488));
        } else if (power > 100 && power <= 1000) {
          depthA =
              ((0.3226 * log(wind) - 0.0252) * (52.545 * log(power) - 180.64));
        } else if (power > 1000 && power <= 10000) {
          depthA =
              ((0.4487 * log(wind) - 0.452) * (209.34 * log(power) - 1345.7));
        } else if (power > 10000) {
          depthA =
              (((0.0729 * wind / 3.6) + 1.0619) * 5.1564 * pow(power, 0.4474));
        } else {
          depthA = 0;
        }
      } else {
        depthA = 0;
      }

      // widthA

      if (typeExplosion == 'Наземний') {
        if (power < 0.1 && wind <= 50) {
          widthA = (((-1.144 * log(wind)) + 4.9061) *
              ((-207.64 * pow(power, 2)) + (44.489 * power) + 0.1228));
        } else if ((power >= 0.1 && power <= 0.5) && wind <= 50) {
          widthA = (((-0.363 * log(wind)) + 2.1473) *
              ((-11.667 * pow(power, 2)) + (11.5 * power) + 1.4667));
        } else if ((power > 0.5 && power <= 5) && wind <= 75) {
          widthA = (((-0.372 * log(wind)) + 2.2152) *
              ((-0.1417 * pow(power, 2)) + (1.625 * power) + 4.2167));
        } else if (power > 5 && power <= 100) {
          widthA = (((-0.294 * log(wind)) + 1.9694) *
              ((-0.0005 * pow(power, 2)) + (0.1562 * power) + 9.3214));
        } else if (power > 100 && power <= 1000) {
          widthA = (((0.0001 * pow(wind, 2)) - (wind * 0.0179) + 1.4445) *
              (3.1725 * log(power) - 5.4798));
        } else if (power > 1000 && power <= 10000) {
          widthA = (((-0.212 * log(wind)) + 1.6773) *
              ((-5e-07 * pow(power, 2)) + (0.0125 * power) + 26.778));
        } else if (power > 10000) {
          widthA = (3.6303 * pow(power, 0.4283));
        } else {
          widthA = 0;
        }
      } else if (typeExplosion == 'Повітряний') {
        if (power < 0.05) {
          widthA = 0;
        } else if ((power >= 0.05 && power < 0.1) &&
            (wind >= 10 && wind <= 18)) {
          widthA = 0.9;
        } else if ((power >= 0.05 && power < 0.1) &&
            (wind >= 19 && wind <= 25)) {
          widthA = 0.3;
        } else if ((power >= 0.1 && power <= 0.5) && wind <= 50) {
          widthA =
              ((-0.918 * log(wind) + 3.957) * (0.793 * log(power) + 2.6069));
        } else if ((power > 0.5 && power <= 5) && wind <= 75) {
          widthA =
              ((0.1763 * log(wind) + 0.4015) * (1.0548 * log(power) + 2.7756));
        } else if (power > 5 && power <= 100) {
          widthA =
              ((-0.318 * log(wind) + 2.0168) * (1.8207 * log(power) + 0.8617));
        } else if (power > 100 && power <= 1000) {
          widthA =
              ((-0.318 * log(wind) + 2.0168) * (4.4643 * log(power) - 11.079));
        } else if (power > 1000 && power <= 10000) {
          widthA =
              ((-0.219 * log(wind) + 1.706) * (17.875 * log(power) - 112.59));
        } else if (power > 10000) {
          widthA = (0.5195 * pow(power, 0.5816));
        } else {
          widthA = 0;
        }
      } else {
        widthA = 0;
      }

      //   depthB =
      if (typeExplosion == 'Наземний') {
        if (power < 0.2) {
          depthB = 0;
        } else if ((power >= 0.2 && power < 0.5) && wind <= 10) {
          depthB = 1.2;
        } else if ((power >= 0.5 && power < 1) && wind <= 25) {
          depthB = 2.2;
        } else if ((power >= 1 && power <= 5) && wind <= 75) {
          depthB = (((3E-06 * pow(wind, 3)) -
                  (0.0005 * pow(wind, 2)) +
                  (wind * 0.0239) +
                  0.6818) *
              ((-0.2027 * pow(power, 2)) + (2.6875 * power) + 1.0216));
        } else if (power > 5 && power <= 100) {
          depthB = (((-7E-05 * pow(wind, 2)) + (wind * 0.0116) + 0.7278) *
              ((-0.0014 * pow(power, 2)) + (0.5104 * power) + 8.7578));
        } else if (power > 100 && power <= 1000) {
          depthB = (((-7E-05 * pow(wind, 2)) + (wind * 0.0116) + 0.7278) *
              ((-0.0001 * pow(power, 2)) + (0.2125 * power) + 25.833));
        } else if (power > 1000 && power <= 10000) {
          depthB = (((-5E-05 * pow(wind, 2)) + (wind * 0.0099) + 0.7835) *
              ((-2E-06 * pow(power, 2)) + (0.0491 * power) + 85.18));
        } else if (power > 10000) {
          depthB =
              (((0.0729 * wind / 3.6) + 1.0619) * 16.216 * pow(power, 0.3317));
        } else {
          depthB = 0;
        }
      } else if (typeExplosion == 'Повітряний') {
        if (power < 50) {
          depthB = 0;
        } else if ((power >= 50 && power < 100) && wind <= 10) {
          depthB = 4.8;
        } else if ((power >= 100 && power < 200) && wind <= 10) {
          depthB = 8.1;
        } else if ((power >= 200 && power < 500) && wind <= 25) {
          depthB =
              (((wind * 0.0273) + 0.3182) * (2.4695 * log(power) + 8.8366));
        } else if ((power >= 500 && power < 1000) && wind <= 25) {
          depthB =
              (((wind * 0.0028) + 0.9306) * (2.4695 * log(power) + 8.8366));
        } else if ((power >= 1000 && power < 2000) && wind <= 25) {
          depthB =
              (((wind * 0.0026) + 0.9359) * (2.4695 * log(power) + 8.8366));
        } else if ((power >= 2000 && power < 5000) && wind <= 50) {
          depthB =
              (((wind * (-0.0174)) + 1.4359) * (49.751 * log(power) - 342.04));
        } else if ((power >= 5000 && power <= 8000) && wind <= 75) {
          depthB =
              ((-0.417 * log(wind) + 2.3923) * (49.751 * log(power) - 342.04));
        } else if (power > 8000 && power <= 10000) {
          depthB =
              ((-0.3 * log(wind) + 2.0411) * (49.751 * log(power) - 342.04));
        } else if (power > 10000) {
          depthB =
              (((0.0729 * wind / 3.6) + 1.0619) * 2.6167 * pow(power, 0.4832));
        } else {
          depthB = 0;
        }
      } else {
        depthB = 0;
      }
      // widthB =

      if (typeExplosion == 'Наземний') {
        if (power < 0.2) {
          widthB = 0;
        } else if ((power >= 0.2 && power < 0.5) && wind <= 10) {
          widthB = 1.1;
        } else if ((power >= 0.5 && power < 1) && wind <= 25) {
          widthB =
              (((wind * -0.0867) + 3.2667) * (1.1718 * log(power) + 1.9035));
        } else if ((power >= 1 && power <= 5) && wind <= 75) {
          widthB =
              ((-0.696 * log(wind) + 3.2658) * (1.1718 * log(power) + 1.9035));
        } else if (power > 5 && power <= 100) {
          widthB =
              ((-0.432 * log(wind) + 2.4491) * (0.0072 * log(power) + 5.3008));
        } else if (power > 100 && power <= 1000) {
          widthB =
              ((-0.432 * log(wind) + 2.4491) * (3.1725 * log(power) - 5.4798));
        } else if (power > 1000 && power <= 10000) {
          widthB =
              ((-0.323 * log(wind) + 2.0412) * (12.936 * log(power) - 77.886));
        } else if (power > 10000) {
          widthB = (2.0379 * pow(power, 0.456));
        } else {
          widthB = 0;
        }
      } else if (typeExplosion == 'Повітряний') {
        if (power < 50) {
          widthB = 0;
        } else if ((power >= 50 && power < 100) && wind <= 10) {
          widthB = 2.2;
        } else if ((power >= 100 && power < 200) && wind <= 10) {
          widthB = 3.4;
        } else if ((power >= 200 && power < 500) && wind <= 25) {
          widthB = (((wind * (-0.09)) + 3.25) * (1.345 * log(power) - 4.9253));
        } else if ((power >= 500 && power < 1000) && wind <= 25) {
          widthB =
              (((wind * (-0.0581)) + 2.453) * (1.345 * log(power) - 4.9253));
        } else if ((power >= 1000 && power < 2000) && wind <= 25) {
          widthB =
              (((wind * (-0.0455)) + 2.1382) * (1.345 * log(power) - 4.9253));
        } else if ((power >= 2000 && power < 5000) && wind <= 50) {
          widthB =
              (((wind * (-0.0378)) + 1.9444) * (4.6921 * log(power) - 30.414));
        } else if ((power >= 5000 && power <= 8000) && wind <= 75) {
          widthB =
              ((-0.855 * log(wind) + 3.7917) * (4.6921 * log(power) - 30.414));
        } else if (power > 8000 && power <= 10000) {
          widthB =
              ((-0.632 * log(wind) + 3.0767) * (4.6921 * log(power) - 30.414));
        } else if (power > 10000) {
          widthB = (0.2335 * pow(power, 0.6296));
        } else {
          widthB = 0;
        }
      } else {
        widthB = 0;
      }
      // depthV =
      if (typeExplosion == 'Наземний') {
        if (power < 1) {
          depthV = 0;
        } else if ((power >= 1 && power < 2) && wind <= 10) {
          depthV = 1.4;
        } else if ((power >= 2 && power < 5) && wind <= 10) {
          depthV = 2.4;
        } else if ((power >= 2 && power < 5) && (wind > 10 && wind <= 25)) {
          depthV = 1.8;
        } else if ((power >= 5 && power < 10) && wind <= 50) {
          depthV =
              ((-0.266 * log(wind) + 1.6868) * (2.9634 * log(power) - 0.349));
        } else if ((power >= 10 && power < 20) && wind <= 50) {
          depthV =
              ((-0.06 * log(wind) + 1.1226) * (7.5979 * log(power) - 12.392));
        } else if ((power >= 20 && power < 50) && wind <= 75) {
          depthV =
              ((-0.149 * log(wind) + 1.3741) * (7.5979 * log(power) - 12.392));
        } else if (power >= 50 && power <= 100) {
          depthV =
              ((0.0327 * log(wind) + 0.8409) * (7.5979 * log(power) - 12.392));
        } else if (power > 100 && power <= 1000) {
          depthV =
              ((0.0327 * log(wind) + 0.8409) * (21.333 * log(power) - 74.991));
        } else if (power > 1000 && power <= 10000) {
          depthV =
              ((0.0779 * log(wind) + 0.7589) * (79.974 * log(power) - 506.87));
        } else if (power > 10000) {
          depthV =
              (((0.0729 * wind / 3.6) + 1.0619) * 5.5759 * pow(power, 0.4095));
        } else {
          depthV = 0;
        }
      } else if (typeExplosion == 'Повітряний' && power > 10000) {
        return (((0.0729 * wind / 3.6) + 1.0619) * 0.6399 * pow(power, 0.5894));
      } else {
        return 0;
      }

      // widthV =

      if (typeExplosion == 'Наземний') {
        if (power < 1) {
          widthV = 0;
        } else if ((power >= 1 && power < 2) && wind <= 10) {
          widthV = 1.2;
        } else if ((power >= 2 && power < 5) && wind <= 10) {
          widthV = 2.3;
        } else if ((power >= 2 && power < 5) && (wind > 10 && wind <= 25)) {
          widthV = 0.5;
        } else if ((power >= 5 && power < 10) && wind <= 50) {
          widthV =
              ((-1.238 * log(wind) + 4.9297) * (1.3696 * log(power) - 0.4358));
        } else if ((power >= 10 && power < 20) && wind <= 50) {
          widthV =
              ((-0.808 * log(wind) + 3.6262) * (1.3336 * log(power) - 0.6062));
        } else if ((power >= 20 && power < 50) && wind <= 75) {
          widthV =
              ((-0.771 * log(wind) + 3.4903) * (1.3336 * log(power) - 0.6062));
        } else if (power >= 50 && power <= 100) {
          widthV =
              ((-0.482 * log(wind) + 2.6074) * (1.3336 * log(power) - 0.6062));
        } else if (power > 100 && power <= 1000) {
          widthV =
              ((-0.482 * log(wind) + 2.6074) * (2.462 * log(power) - 5.7505));
        } else if (power > 1000 && power <= 10000) {
          widthV =
              ((-0.331 * log(wind) + 2.0502) * (7.9974 * log(power) - 47.187));
        } else if (power > 10000) {
          widthV = (0.5236 * pow(power, 0.5547));
        } else {
          widthV = 0;
        }
      } else if (typeExplosion == 'Повітряний' && power > 10000) {
        widthV = (0.0287 * pow(power, 0.7908));
      } else {
        widthV = 0;
      }

      // depthG =

      if (typeExplosion == 'Наземний') {
        if (power < 5) {
          depthG = 0;
        } else if ((power >= 5 && power < 10) && wind <= 10) {
          depthG = 1.4;
        } else if ((power >= 10 && power < 20) && wind <= 10) {
          depthG = 2.6;
        } else if ((power >= 20 && power < 50) && wind <= 10) {
          depthG = 3.5;
        } else if ((power >= 50 && power < 100) && wind <= 25) {
          depthG =
              ((-0.222 * log(wind) + 1.7156) * (1.4427 * log(power) - 0.2439));
        } else if ((power >= 100 && power < 200) && wind <= 25) {
          depthG =
              ((-0.614 * log(wind) + 2.976) * (1.4427 * log(power) - 0.2439));
        } else if ((power >= 200 && power < 500) && wind <= 50) {
          depthG =
              ((-0.147 * log(wind) + 1.3796) * (10.106 * log(power) - 36.722));
        } else if (power >= 500 && power <= 1000) {
          depthG =
              ((-0.207 * log(wind) + 1.5486) * (10.106 * log(power) - 36.722));
        } else if (power > 1000 && power < 2000) {
          depthG =
              ((-0.207 * log(wind) + 1.5486) * (44.337 * log(power) - 291));
        } else if (power >= 2000 && power <= 10000) {
          depthG =
              ((-0.196 * log(wind) + 1.6657) * (44.337 * log(power) - 291));
        } else if (power > 10000) {
          depthG =
              (((0.0729 * wind / 3.6) + 1.0619) * 0.4541 * pow(power, 0.5938));
        } else {
          depthG = 0;
        }
      } else if (typeExplosion == 'Повітряний' && power > 10000) {
        depthG =
            (((0.0729 * wind / 3.6) + 1.0619) * 0.0127 * pow(power, 0.8984));
      } else {
        depthG = 0;
      }

      // widthG =

      if (typeExplosion == 'Наземний') {
        if (power < 5) {
          widthG = 0;
        } else if ((power >= 5 && power < 10) && wind <= 10) {
          widthG = 0.9;
        } else if ((power >= 10 && power < 20) && wind <= 10) {
          widthG = 2.0;
        } else if ((power >= 20 && power < 50) && wind <= 10) {
          widthG = 2.6;
        } else if ((power >= 50 && power < 100) && wind <= 25) {
          widthG =
              ((-1.264 * log(wind) + 5.0676) * (1.5148 * log(power) - 4.0427));
        } else if ((power >= 100 && power < 200) && wind <= 25) {
          widthG =
              ((-0.941 * log(wind) + 4.0284) * (1.5148 * log(power) - 4.0427));
        } else if ((power >= 200 && power < 500) && wind <= 50) {
          widthG =
              ((-0.717 * log(wind) + 3.3383) * (1.6565 * log(power) - 4.5716));
        } else if (power >= 500 && power <= 1000) {
          widthG =
              ((-0.573 * log(wind) + 2.8697) * (1.6565 * log(power) - 4.5716));
        } else if (power > 1000 && power < 2000) {
          widthG =
              ((-0.573 * log(wind) + 2.8697) * (4.939 * log(power) - 28.699));
        } else if (power >= 2000 && power <= 10000) {
          widthG =
              ((-0.402 * log(wind) + 2.3013) * (4.939 * log(power) - 28.699));
        } else if (power > 10000) {
          widthG = (0.1547 * pow(power, 0.553));
        } else {
          widthG = 0;
        }
      } else if (typeExplosion == 'Повітряний' && power > 10000) {
        widthG = (0.008 * pow(power, 0.8125));
      } else {
        widthG = 0;
      }

      return 2 + 2;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Вихідні дані')),
      drawer: buildDrawer(context, route),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.only(
                  left: 10.0, bottom: 0.0, top: 10.0, right: 10.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                ],
                initialValue: StartEmountRadiation,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                decoration: const InputDecoration(
                  labelText: 'Потужність вибуху (в кілотоннах)',
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 10.0, bottom: 8.0, top: 8.0, right: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  // isCollapsed: true,
                ),
                onChanged: (rrr) {
                  if (double.tryParse(rrr) != null) {
                    context
                        .read<GetExplosionPower>()
                        .changeExplosionPower(double.parse(rrr));
                  }
                },
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 10.0, right: 10.0),
            child: DropdownButtonFormField(
              borderRadius: BorderRadius.circular(10.0),
              value: context.watch<GetTypeOfExplosion>().getTypeOfExplosion,
              items: typeOfExplosion.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) => context
                  .read<GetTypeOfExplosion>()
                  .changeTypeOfExplosion(newValue.toString()),
              decoration: const InputDecoration(
                labelText: 'Вид вибуху',
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
                contentPadding: EdgeInsets.only(
                    left: 10.0, bottom: 5.0, top: 5.0, right: 10.0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                // isCollapsed: true,
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: const Color.fromARGB(255, 227, 222, 235),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.only(
                  left: 10.0, bottom: 0.0, top: 10.0, right: 10.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                ],
                initialValue: StartWindSpeed,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                decoration: const InputDecoration(
                  labelText: 'Швидкість вітру (км/год)',
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 10.0, bottom: 8.0, top: 8.0, right: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  // isCollapsed: true,
                ),
                onChanged: (rrr) {
                  if (double.tryParse(rrr) != null) {
                    context
                        .read<GetWindSpeed>()
                        .changeWindSpeed(double.parse(rrr));
                  }
                },
              )),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: 240,
                    margin: const EdgeInsets.only(
                        left: 10.0, bottom: 0.0, top: 15.0, right: 10.0),
                    child: SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          size: 120,
                          angleRange: 360,
                          startAngle: 270,
                          customWidths: CustomSliderWidths(
                            progressBarWidth: 6,
                            trackWidth: 6,
                            handlerSize: 10,
                          ),
                          customColors: CustomSliderColors(
                            trackColor: Colors.blue,
                            progressBarColor: Colors.blue,
                            dotColor: Colors.red,
                          ),
                          infoProperties: InfoProperties(
                            modifier: percentageModifier,
                            mainLabelStyle: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          )),
                      min: 0,
                      max: 360,
                      initialValue:
                          context.watch<GetWindDirection>().getWindDirection,
                      onChange: (double value) => context
                          .read<GetWindDirection>()
                          .changeWindDirection(value),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20,
                top: 50,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const Text(
                    "Напрямок",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      // color: Color.fromARGB(255, 73, 73, 73),
                      // backgroundColor: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const Text(
                    "вітру",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              nuclearExplosion();
              context.read<GetFireBall>().changeFireBall(fireBall);
              context
                  .read<GetOverpressure20>()
                  .changeOverpressure20(overpressure20);
              context
                  .read<GetOverpressure10>()
                  .changeOverpressure10(overpressure10);
              context
                  .read<GetOverpressure5>()
                  .changeOverpressure5(overpressure5);
              context
                  .read<GetOverpressure1>()
                  .changeOverpressure1(overpressure1);
              context
                  .read<GetThermalRadiation1>()
                  .changeThermalRadiation1(thermalRadiation1);
              context
                  .read<GetThermalRadiation2>()
                  .changeThermalRadiation2(thermalRadiation2);
              context
                  .read<GetThermalRadiation3>()
                  .changeThermalRadiation3(thermalRadiation3);
              context
                  .read<GetIonizingRadiation500>()
                  .changeIonizingRadiation500(ionizingRadiation500);
              context
                  .read<GetIonizingRadiation100>()
                  .changeIonizingRadiation100(ionizingRadiation100);
              context.read<GetDepthA>().changeDepthA(depthA);
              context.read<GetWidthA>().changeWidthA(widthA);
              context.read<GetDepthB>().changeDepthB(depthB);
              context.read<GetWidthB>().changeWidthB(widthB);
              context.read<GetDepthV>().changeDepthV(depthV);
              context.read<GetWidthV>().changeWidthV(widthV);
              context.read<GetDepthG>().changeDepthG(depthG);
              context.read<GetWidthG>().changeWidthG(widthG);
              context.read<GetZoom>().changeZoom(10);
              context
                  .read<GetFloatingButtonViev>()
                  .changeFloatingButtonViev(true);

              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.wb_sunny_outlined),
            label: const Text('Клацніть, щоб змоделювати вибух'),
          ),
        ]),
      )),
    );
  }
}

String percentageModifier(double value) {
  final roundedValue = value.ceil().toInt().toString();
  return '$roundedValue°';
}

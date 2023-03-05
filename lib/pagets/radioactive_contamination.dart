import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'package:provider/provider.dart';

class RadioactiveContamination extends StatelessWidget {
  static const String route = 'RadioactiveContamination';
  const RadioactiveContamination({super.key});

  @override
  Widget build(BuildContext context) {
    double depthA = context.watch<GetDepthA>().getDepthA;
    double widthA = context.watch<GetWidthA>().getWidthA;
    double depthB = context.watch<GetDepthB>().getDepthB;
    double widthB = context.watch<GetWidthB>().getWidthB;
    double depthV = context.watch<GetDepthV>().getDepthV;
    double widthV = context.watch<GetWidthV>().getWidthV;
    double depthG = context.watch<GetDepthG>().getDepthG;
    double widthG = context.watch<GetWidthG>().getWidthG;
    return Scaffold(
      appBar: AppBar(title: const Text('Радіоактивне зараження місцевості')),
      drawer: buildDrawer(context, route),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 10.0, right: 10.0),
            padding: const EdgeInsets.only(
                left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 210, 211),
            ),
            child: const Text(
                "Зона надзвичайно небезпечного зараження (зона Г) на зовнішній межі Д = 4000 рад. Рівні радіації Ро = 800 Р/год., Р10 = 50 Р/год. Роботи зупиняються на декілька діб та поновлюються після спаду рівня радіації до безпечного значення.",
                style: TextStyle(
                  fontSize: 12.0,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 0.0, right: 10.0),
            child: Table(
              columnWidths: const {1: FractionColumnWidth(.2)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text("Глибина зони (км)",
                              textScaleFactor: 0.95)),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(depthG.toStringAsFixed(3),
                              textScaleFactor: 1)),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 239, 240),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text("Ширина зони (км)",
                              textScaleFactor: 0.95)),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(widthG.toStringAsFixed(3),
                              textScaleFactor: 1)),
                    ]),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 2.0, right: 10.0),
            padding: const EdgeInsets.only(
                left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 210, 211),
            ),
            child: const Text(
                "Зона небезпечного зараження (зона В) - Д = 1200-4000 рад. Рівень радіації на зовнішній межі Ро = 240 Р/год., Р10 = 15 Р/год. У цій зоні роботи на об'єктах зупиняються від 1 до 3—4 діб. Люди евакуйовуються чи ховаються в захисних спорудах.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 255, 0, 0),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 0.0, right: 10.0),
            child: Table(
              columnWidths: const {1: FractionColumnWidth(.2)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Глибина зони (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            depthV.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                          )),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 239, 240),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text("Ширина зони (км)",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                              textScaleFactor: 0.95)),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            widthV.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                            ),
                          )),
                    ]),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 2.0, right: 10.0),
            padding: const EdgeInsets.only(
                left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 210, 211),
            ),
            child: const Text(
                "Зона сильного зараження (зона Б) - Д = 400-1200 рад. Рівень радіації на зовнішній межі Ро = 80 Р/год., Р10 = 5 Р/год. Роботи зупиняються на 1 добу. Люди ховаються у сховищах чи евакуйовуються.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 0, 167, 50),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 0.0, right: 10.0),
            child: Table(
              columnWidths: const {1: FractionColumnWidth(.2)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Глибина зони (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 167, 50),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            depthB.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 167, 50),
                            ),
                          )),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 239, 240),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Ширина зони (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 167, 50),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            widthB.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 167, 50),
                            ),
                          )),
                    ]),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 2.0, right: 10.0),
            padding: const EdgeInsets.only(
                left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 209, 210, 211),
            ),
            child: const Text(
                "Зона помірного зараження (зона А) - Д = 40-400 рад. Рівень радіації на зовнішній межі зони Ро = 8 Р/год., Р10 = 0,5 Р/год. В зоні А роботи на об'єктах, як правило, не зупиняються. На відкритій місцевості, розташованій у середині зони чи у її внутрішній межі, роботи припиняються на декілька годин.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 2, 24, 224),
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 0.0, right: 10.0),
            child: Table(
              columnWidths: const {1: FractionColumnWidth(.2)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Глибина зони (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 24, 224),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            depthA.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 24, 224),
                            ),
                          )),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 239, 240),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Ширина зони (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 24, 224),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            widthA.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 2, 24, 224),
                            ),
                          )),
                    ]),
              ],
            ),
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
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.settings),
            label: const Text('Клацніть, щоб перейти до мапи'),
          ),
        ],
      )))),
    );
  }
}

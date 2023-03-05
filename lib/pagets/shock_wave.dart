import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'package:provider/provider.dart';

class ShockWave extends StatelessWidget {
  static const String route = 'ShockWave';
  const ShockWave({super.key});

  @override
  Widget build(BuildContext context) {
    double firebol = context.watch<GetFireBall>().getFireBall;
    double overpressure20 =
        context.watch<GetOverpressure20>().getOverpressure20;
    double overpressure10 =
        context.watch<GetOverpressure10>().getOverpressure10;
    double overpressure5 = context.watch<GetOverpressure5>().getOverpressure5;
    double overpressure1 = context.watch<GetOverpressure1>().getOverpressure1;

    return Scaffold(
      appBar: AppBar(title: const Text('Ударна хвиля')),
      drawer: buildDrawer(context, route),
      // backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 10.0, bottom: 0.0, top: 10.0, right: 10.0),
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
                          "Радіус вогняної кулі (км)",
                          textScaleFactor: 0.95,
                          style:
                              TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            firebol.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0)),
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
                            "Радіус ураження вкрай важкої ступіні (спостерігається пошкодження органів не сумісне з життям) та зони суцільного руйнування (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                                color: Color.fromARGB(255, 201, 1, 1)),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            overpressure20.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 201, 1, 1)),
                          )),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                              "Радіус ураження важкої ступіні (сильні контузії, травми черепа та скелета, розриви органів черевної порожнини) та зони сильного руйнування (км)",
                              textScaleFactor: 0.95,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 153, 1, 1)))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            overpressure10.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 153, 1, 1),
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
                            "Радіус ураження середньої ступіні (вивихи кінцівок, контузії середньої важкості, кровотеча з вух, носа, тощо) (км))",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 112, 1, 1),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            overpressure5.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 112, 1, 1),
                            ),
                          )),
                    ]),
                TableRow(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 224, 224),
                    ),
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              left: 5.0, bottom: 10.0, top: 10.0, right: 10.0),
                          child: const Text(
                            "Радіус ураження легкої ступіні (легка контузія, синяк, тощо) та зони слабких руйнувань (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 87, 1, 1),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            overpressure1.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 87, 1, 1),
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

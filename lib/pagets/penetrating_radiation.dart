import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'package:provider/provider.dart';

class PenetratingRadiation extends StatelessWidget {
  static const String route = 'PenetratingRadiation';
  const PenetratingRadiation({super.key});

  @override
  Widget build(BuildContext context) {
    double ionizingRadiation500 =
        context.watch<GetIonizingRadiation500>().getIonizingRadiation500;
    double ionizingRadiation100 =
        context.watch<GetIonizingRadiation100>().getIonizingRadiation100;
    return Scaffold(
      appBar: AppBar(title: const Text('Проникаюча радіація')),
      drawer: buildDrawer(context, route),
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
                            "Радіус випромінювання 500 бер (можливий летальний результат приблизно через 1 місяць, 15% тих, хто вижив, зрештою помруть від раку) (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 6, 10, 245),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            ionizingRadiation500.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 6, 10, 245),
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
                            "Радіус випромінювання 100 бер (спричиняє хворобу, ймовірність смерті менше 5% протягом 60 днів, 3% тих, хто вижив, помруть від раку) (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 94, 7, 255),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            ionizingRadiation100.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 94, 7, 255),
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

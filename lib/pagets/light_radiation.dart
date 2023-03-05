import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';
import 'package:nuclear/calculate/data_calculate.dart';
import 'package:provider/provider.dart';

class LightRadiation extends StatelessWidget {
  static const String route = 'LightRadiation';
  const LightRadiation({super.key});

  @override
  Widget build(BuildContext context) {
    double thermalRadiation1 =
        context.watch<GetThermalRadiation1>().getThermalRadiation1;
    double thermalRadiation2 =
        context.watch<GetThermalRadiation2>().getThermalRadiation2;
    double thermalRadiation3 =
        context.watch<GetThermalRadiation3>().getThermalRadiation3;
    return Scaffold(
      appBar: AppBar(title: const Text('Світлове випромінювання')),
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
                            "Радіус дії світлового випромінювання - опіки III ступеню (омертвіння всіх шарів шкіри та прилеглих тканин) (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 100, 5),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            thermalRadiation3.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 1, 100, 5),
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
                            "Радіус дії світлового випромінювання – опіки II ступеню (утворення пухирів) (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 3, 187, 12),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            thermalRadiation2.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 3, 187, 12),
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
                            "Радіус дії світлового випромінювання - опіки I ступеню (почервоніння та набряк шкіри) (км)",
                            textScaleFactor: 0.95,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 13),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 0, bottom: 10.0, top: 10.0, right: 10.0),
                          // height: 24,
                          child: Text(
                            thermalRadiation1.toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 255, 13),
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

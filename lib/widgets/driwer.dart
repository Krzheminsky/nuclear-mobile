import 'package:flutter/material.dart';
import 'package:nuclear/pagets/about.dart';
import 'package:nuclear/pagets/get_weather.dart';
import "package:nuclear/pagets/home.dart";
import 'package:nuclear/pagets/add_data.dart';
import 'package:nuclear/pagets/light_radiation.dart';
import 'package:nuclear/pagets/penetrating_radiation.dart';
import 'package:nuclear/pagets/radioactive_contamination.dart';
import 'package:nuclear/pagets/shock_wave.dart';

Drawer buildDrawer(BuildContext context, String currentRoute) {
  return Drawer(
    backgroundColor: Colors.grey[200],
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 64.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Center(
              child: Text('Моделювання ядерного вибуху',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 6,
          child: ListTile(
            // contentPadding: null,
            title: const Text('Головна'),
            subtitle: const Text(
              'Мапа, нанесення зон ураження',
              style: TextStyle(fontSize: 10),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            //leading: Icon(Icons.map_outlined),
            dense: true,
            // enabled: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 6,
          child: ListTile(
            title: const Text('Метеодані'),
            subtitle: const Text(
              'Отримання метеоданих',
              style: TextStyle(fontSize: 10),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GetWeather();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 6,
          child: ListTile(
            title: const Text('Вихідні дані'),
            subtitle: const Text(
              'Внесення відомостей для розрахунків',
              style: TextStyle(fontSize: 10),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddData();
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: const Text('Ударна хвиля'),
            // subtitle: const Text(
            //   'Ураження від ударної хвилі',
            //   style: TextStyle(fontSize: 10),
            // ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ShockWave();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: const Text('Світлове випромінювання'),
            // subtitle: const Text(
            //   'Можливі втрати населення',
            //   style: TextStyle(fontSize: 10),
            // ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LightRadiation();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: const Text('Проникаюча радіація'),
            // subtitle: const Text(
            //   'Довідкова інформація про хімічну речовину',
            //   style: TextStyle(fontSize: 10),
            // ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PenetratingRadiation();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            title: const Text('Радіоактивне зараження місцевості'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RadioactiveContamination();
                  },
                ),
              );
            },
          ),
        ),
        Card(
          color: Colors.yellow[200],
          elevation: 6,
          child: ListTile(
            title: const Text('Про NuclearSim'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            ),
            dense: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const About();
                  },
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

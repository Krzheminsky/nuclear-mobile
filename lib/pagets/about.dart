import 'package:flutter/material.dart';
import 'package:nuclear/widgets/driwer.dart';

class About extends StatelessWidget {
  static const String route = 'About';
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Про NuclearSim')),
      drawer: buildDrawer(context, route),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                  child: const Text(
                    'Слава Україні! Героям Слава!',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                  child:
                      const Text("Шановні співвітчизники, доброго часу доби!")),
              Container(
                margin: const EdgeInsets.only(
                    left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                child: const Text(
                  "     Перед використанням застосунку NuclearSim автор зауважує: застосунок НЕ Є ОФІЦІЙНИМ ДЖЕРЕЛОМ отримання розрахункових даних, він задуманий, як освітній ресурс. Його не слід використовувати для аварійного планування або реагування на надзвичайні ситуації, коли на карту можуть бути поставлені життя та здоров'я. Це не ідеальне моделювання. Будь ласка, не використовуйте NuclearSimulation, щоб прогнозувати реальний вибух. Дякую.\n     NuclearSim розроблено з метою допомоги фахівцям з цивільного захисту та громадянам оперативно, швидко визначити основні загрози, які можуть виникнути при застосуванні ядерної зброї, а також для фахівців навчально-методичних центрів цивільного захисту та безпеки життєдіяльності для проведення занять із відповідними категоріями громадян.\n     Також зауважу, що це спрощена модель вибуху, яка розглядає тільки наземний вибух та вибух у повітрі на висоті 500 метрів.\n     У використанні застосунок дуже простий:\n     - за потреби, отримуємо метеодані та передаємо їх до вихідних даних;\n     - у вихідних даних вибираємо потужність та вид вибуху, при бажанні коригуємо швидкість і напрямок вітру; \n     - клацаємо, щоб змоделювати вибух;\n     - внизу мапи з'являються чотири кнопочки, якими можна вмикати та вимикати відповідні шари.\n     Для кращої візуалізації розрахунки та моделювання вибуху виконано тотожними кольорами.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                  child: const Text(
                    "З повагою, автор - Віктор Кржемінський.",
                    textAlign: TextAlign.left,
                  )),
              Container(
                margin: const EdgeInsets.only(
                    left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                child: const Text(
                    "     Якщо є пропозиції щодо покращання застосунку - пишіть: krzheminsky@ukr.net"),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, bottom: 0.0, top: 10.0, right: 20.0),
                  child: const Text("Якби хто хотів підтримати проект:")),
              const Text("5168 7451 1577 2458"),
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
                label: const Text('Перейти до мапи'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

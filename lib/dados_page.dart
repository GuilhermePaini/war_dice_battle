import 'dart:math';

import 'package:flutter/material.dart';

import 'dice_row.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  var attackersDice = List.generate(3, (index) => index = Random().nextInt(6) + 1);

  var defendersDice = List.generate(3, (index) => index = Random().nextInt(6) + 1);

  var attackersLostTroops = 0;
  var defenderLostTroops = 0;

  void calculateResults() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: const [
              Expanded(
                  child: Center(
                      child: Icon(
                Icons.emoji_events,
                color: Colors.grey,
                size: 24.0,
                semanticLabel: 'Results',
              )))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Expanded(
                  child: Center(
                      child: Text.rich(
                TextSpan(
                  children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.red,
                      size: 24.0,
                      semanticLabel: 'Attackers',
                    )),
                    TextSpan(text: " $attackersLostTroops", style: const TextStyle(color: Colors.red, fontSize: 24)),
                  ],
                ),
              ))),
              const Expanded(child: SizedBox(width: 80)),
              Expanded(
                  child: Center(
                      child: Text.rich(
                TextSpan(
                  children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.shield,
                      color: Colors.yellow,
                      size: 24.0,
                      semanticLabel: 'Defenders',
                    )),
                    TextSpan(text: " $defenderLostTroops", style: const TextStyle(color: Colors.yellow, fontSize: 24)),
                  ],
                ),
              )))
            ]),
          ),
          DiceRow(attackersDice: attackersDice[0], defendersDice: defendersDice[0]),
          DiceRow(attackersDice: attackersDice[1], defendersDice: defendersDice[1]),
          DiceRow(attackersDice: attackersDice[2], defendersDice: defendersDice[2]),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
                ),
                child: const Text("⚔ Battle ⚔"),
                onPressed: () {
                  setState(() {
                    defenderLostTroops = 0;
                    attackersLostTroops = 0;

                    attackersDice = List.generate(3, (index) => index = Random().nextInt(6) + 1);
                    defendersDice = List.generate(3, (index) => index = Random().nextInt(6) + 1);

                    attackersDice.sort((b, a) => a.compareTo(b));
                    defendersDice.sort((b, a) => a.compareTo(b));

                    for (var i = 0; i < attackersDice.length; i++) {
                      if (attackersDice[i] > defendersDice[i]) {
                        defenderLostTroops -= attackersDice[i] - defendersDice[i];
                        continue;
                      }

                      if (attackersDice[i] < defendersDice[i]) {
                        attackersLostTroops -= defendersDice[i] - attackersDice[i];
                        continue;
                      }
                    }
                  });
                },
              )),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({super.key});

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  var attackersDice =
      List.generate(3, (index) => index = Random().nextInt(6) + 1);

  var defendersDice =
      List.generate(3, (index) => index = Random().nextInt(6) + 1);

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
                  Icons.local_fire_department_outlined,
                  color: Colors.red,
                  size: 24.0,
                  semanticLabel: 'Attackers',
                ),
              )),
              Expanded(
                  child: SizedBox(
                width: 80,
                child: Center(
                    child: Icon(
                  Icons.emoji_events,
                  color: Colors.grey,
                  size: 24.0,
                  semanticLabel: 'Results',
                )),
              )),
              Expanded(
                  child: Center(
                child: Icon(
                  Icons.shield,
                  color: Colors.blue,
                  size: 24.0,
                  semanticLabel: 'Defenders',
                ),
              )),
            ]),
          ),
          DiceRow(
              attackersDice: attackersDice[0], defendersDice: defendersDice[0]),
          DiceRow(
              attackersDice: attackersDice[1], defendersDice: defendersDice[1]),
          DiceRow(
              attackersDice: attackersDice[2], defendersDice: defendersDice[2]),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
                ),
                child: const Text("⚔ Battle ⚔"),
                onPressed: () {
                  setState(() {
                    attackersDice = List.generate(
                        3, (index) => index = Random().nextInt(6) + 1);
                    defendersDice = List.generate(
                        3, (index) => index = Random().nextInt(6) + 1);
                  });
                },
              )),
        ],
      ),
    );
  }
}

class DiceRow extends StatefulWidget {
  const DiceRow(
      {Key? key, required this.attackersDice, required this.defendersDice})
      : super(key: key);

  final int attackersDice;
  final int defendersDice;

  @override
  State<DiceRow> createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  Text labelForResults() {
    const labelFontWeight = FontWeight.bold;
    const labelFontSize = 20.0;

    if (widget.attackersDice > widget.defendersDice) {
      return Text(
        '- ${(widget.attackersDice - widget.defendersDice).toString()}',
        style: const TextStyle(
            color: Colors.blue,
            fontWeight: labelFontWeight,
            fontSize: labelFontSize),
      );
    }

    if (widget.attackersDice < widget.defendersDice) {
      return Text(
        '- ${(widget.defendersDice - widget.attackersDice).toString()}',
        style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: labelFontSize),
      );
    }

    return const Text(
      "0",
      style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: labelFontSize),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'images/dice${widget.attackersDice}.png',
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 80, child: Center(child: labelForResults()))),
            ),
            Expanded(
              child: Image.asset('images/dice${widget.defendersDice}.png',
                  color: Colors.blue),
            ),
          ],
        ));
  }
}

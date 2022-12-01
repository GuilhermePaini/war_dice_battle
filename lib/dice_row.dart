import 'package:flutter/material.dart';

class DiceRow extends StatefulWidget {
  const DiceRow({Key? key, required this.attackersDice, required this.defendersDice}) : super(key: key);

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
      return const Text(
        '-1',
        style: TextStyle(color: Colors.yellow, fontWeight: labelFontWeight, fontSize: labelFontSize),
      );
    }

    if (widget.attackersDice < widget.defendersDice) {
      return const Text(
        '-1',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: labelFontSize),
      );
    }

    return const Text(
      '-1',
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: labelFontSize),
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
                  child: SizedBox(width: 80, child: Center(child: labelForResults()))),
            ),
            Expanded(
              child: Image.asset('images/dice${widget.defendersDice}.png', color: Colors.yellow),
            ),
          ],
        ));
  }
}

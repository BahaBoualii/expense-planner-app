import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctAmount;

  ChartBar(this.label, this.spendingAmount, this.spendingPctAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 15,
          child: FittedBox(
            child: Text(
              'TND ${spendingAmount.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(211, 211, 211, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctAmount,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

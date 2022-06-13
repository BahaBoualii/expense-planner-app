import 'package:flutter/material.dart';

class Transaction {
  late final String id;
  late final String name;
  late final double amount;
  late final DateTime date;

  Transaction(
      {required this.id,
      required this.name,
      required this.amount,
      required this.date});
}

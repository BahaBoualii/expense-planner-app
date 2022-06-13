import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  late final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _TitleController = TextEditingController();
  final TextEditingController _AmountController = TextEditingController();
  late DateTime _pickedDate = DateTime.now();

  void _submitData() {
    final enteredText = _TitleController.text;
    final enteredAmount = double.parse(_AmountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0 || _pickedDate == null) {
      return;
    }

    widget.addTx(
      enteredText,
      enteredAmount,
      _pickedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2011),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        _pickedDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              cursorColor: Theme.of(context).primaryColor,
              controller: _TitleController,
              onSubmitted: (_) => _submitData(),
              decoration: const InputDecoration(
                hintText: 'Title',
                icon: Icon(Icons.text_fields),
                helperText: 'On what did u spend ur money ?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            TextField(
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              controller: _AmountController,
              decoration: const InputDecoration(
                hintText: 'Amount',
                icon: Icon(Icons.money_rounded),
                helperText: 'How much did you spend ?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _pickedDate == null
                        ? 'No Date Chosen !!'
                        : 'Picked Date: ${DateFormat.yMd().format(_pickedDate)}',
                  ),
                ),
                Container(
                  height: 70,
                  child: TextButton(
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _submitData;
              },
              child: const Text(
                'Add Transaction',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

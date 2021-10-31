import 'package:budgit/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'expense.dart';
import 'detail.dart';
import 'summary.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {

  final incomeInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Income"
          ),
          TextField(
            controller: incomeInput,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: '')),
              );
            },
            child: const Text('Save'),
          ),
        ]
      )
    );
  }
}

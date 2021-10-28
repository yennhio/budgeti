import 'package:flutter/material.dart';
import 'add.dart';
import 'expense.dart';
import 'main.dart';
import 'summary.dart';

class DetailPage extends StatefulWidget {
  var details;
  DetailPage(this.details);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${widget.details.category}"),
          Text("${widget.details.notes}"),
          Text("${widget.details.total}"),

        ]
      )
    );
  }
}

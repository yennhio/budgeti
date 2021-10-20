import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  late String category = '';
  late String note = '';
  late double total = 0;

  final getCategory = TextEditingController();
  final getNotes = TextEditingController();
  final getTotal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 250,
            margin: EdgeInsets.only(top:100, left: 47),
            child: TextField(
              style: TextStyle(fontSize: 16),
              controller: getCategory,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Category e.g. McDonald's"
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 47, top: 20),
            width: 300,
            child: TextField(
              controller: getNotes,
              obscureText: false,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                hintText: "Notes"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text (
                  'Total',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 20, left: 30, right: 47),
                child: TextField(
                  controller: getTotal,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 23),
                  decoration: InputDecoration(
                      icon: Icon(Icons.attach_money),
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      counterText: ""
                  ),
                ),
              ),
            ]
          ),
          Container(
            alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ),
        ],
    )
    );

}
}
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top:100, left: 45),
                width: 155,
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      hintText: "Category"
                  ),
                ),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.only(top:100, right: 47),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.attach_money),
                      counterText: ""
                  ),
                ),
              ),
            ]
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 300,
            child: TextField(
              obscureText: false,
              maxLines: 10,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: "Notes"
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
          Navigator.pop(context);
          },
            child: const Text('Save'),
          ),
        ],
    )
    );
  }
}

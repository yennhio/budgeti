import 'package:budgit/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detail.dart';
import 'summary.dart';
import 'main.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {

  final incomeInput = TextEditingController();

  Future<bool> saveText() async{
    String realIncome = incomeInput.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('OurText', realIncome);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 50, left: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.grey,
                size: 35,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Income",
                      style: TextStyle(
                          fontWeight:FontWeight.w700,
                          fontSize: 30,
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  width: 300,
                  child: TextField(
                    controller: incomeInput,
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                        isDense: true,
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
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: ()  {
                    saveText();
                    MyHomePageState().setText();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: '', incomeInput: '',)),
                    );
                  },
                  child: const Text('Save'),
                ),
              ]
            ),
          ),
        ],
      )
    );


  }
}

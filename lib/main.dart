import 'package:flutter/material.dart';
import 'add.dart';
import 'expense.dart';
import 'detail.dart';
import 'summary.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans'
      ),
      home: MyHomePage(title: 'My spending'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late double remain = 0;
  double income = 0;
  String text = '';

  var getCategory = TextEditingController();
  var getNotes = TextEditingController();
  var getTotal = TextEditingController();

  void calculateRemaining(text) {
    this.text = text;
    income = double.parse(this.text);
    setState(() {
      remain = income - 5;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                      ),
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.blue, Colors.white]
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            spreadRadius: 7,
                            blurRadius: 30,
                            offset: Offset(0, 3)
                          )
                        ]
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top:150, left:40),
                  child: Text(
                    'My Spending',
                        style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600),
                  )
                )
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 60, top: 40),
                    child: Text(
                      'Income',
                      style: TextStyle(fontSize: 23),
                    ),
                       ),
                  Container(
                    margin: EdgeInsets.only(left: 50,top: 40),
                    child: Icon(
                      Icons.attach_money,
                      size: 35,
                      color: Colors.grey
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 60, top: 40),
                    width: 100,
                      child: TextField(
                        style: TextStyle(fontSize: 23),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.blue.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                            ),
                            counterText: ""
                        ),
                        onChanged: (text) => this.calculateRemaining(text)
                      ),
                     ),
                ],
              ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Text(
                        'Remaining',
                        style: TextStyle(fontSize: 23),
                      )
                  ),
                    Container(
                      margin: EdgeInsets.only(left: 14),
                      child: Icon(
                          Icons.attach_money,
                          size: 35,
                        color: Colors.grey
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 7, right: 60),
                    width: 100,
                    height: 39,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        remain == null ? '0' : remain.toString(),
                        style: TextStyle(
                            fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ]
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top:40, left: 47),
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    controller: getCategory,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.blue.shade50,
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
                        fillColor: Colors.blue.shade50,
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
                              prefixIcon: Icon(Icons.attach_money),
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: Colors.blue.shade50,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SummaryPage()),
                      );
                    },
                    child: const Text('Add Expense'),
                  ),
                ),
              ],
            )

      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SummaryPage()),
          );
        },
        child: Icon(Icons.format_list_bulleted),
      ), // This trailing comma makes auto-formatting nicer for build methods.


    );
  }
}


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'summary.dart';
import 'income.dart';
import 'dart:convert';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgeti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans'
      ),
      home: MyHomePage(title: 'My spending', incomeInput: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required String incomeInput}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage> {

  double displayIncome = 0;

  Future<double?> getIncome() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('YourIncome');
  }

  setIncome() {
    getIncome().then((value) {
      setState(() {
        displayIncome = value!;
      });
    });
  }

  final getCategory = TextEditingController();
  final getNotes = TextEditingController();
  final getTotal = TextEditingController();


  Future<bool> saveCategory() async{
    String realCategory = getCategory.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourCategory', realCategory);
  }

  Future<bool> saveNotes() async{
    String realNote = getNotes.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourNote', realNote);
  }

  Future<bool> saveTotal() async{
    double realTotal = double.parse(getTotal.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble('YourTotal', realTotal);
  }

  double remain = 0;
  calculateRemaining() {

    List<double> remainArray = [];
    double fullIncome = 0;
    double totalExpenses = 0;

    getIncome().then((value) {
        fullIncome = value!;
    });

    SummaryPageState().getTotalArray().then((value) {

      var dartRemain = jsonDecode(value!);
      remainArray = dartRemain != null ? List.from(dartRemain) : null!;

      for (int i=0; i<remainArray.length; i++) {
        totalExpenses += remainArray[i];
      }

      setState(() {
        remain = fullIncome - totalExpenses;
      });

    });


  }

  Future<bool> saveRemaining() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble('YourRemaining', double.parse(getIncome().toString()) - double.parse(getTotal.text));
  }

  Future<double?> getRemaining() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('YourRemaining');
  }

  @override
  void initState() {
    super.initState();
    setIncome();
    calculateRemaining();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      margin: EdgeInsets.only(top: 40),
                      width: 100,
                      height: 39,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          displayIncome.toString(),
                          style: TextStyle(
                              fontSize: 23),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, right: 10),
                      child: IconButton(
                        onPressed: ()  {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IncomePage()),
                          );
                        },
                        icon: Icon(
                          Icons.create_rounded,
                          color: Colors.grey,
                          size: 35,
                        ),
                      ),
                    )
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
                          remain.toString(),
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
                    margin: EdgeInsets.only(top:80, left: 47),
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      controller: getCategory,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: Colors.white,
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
                          fillColor: Colors.white,
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
                                fillColor: Colors.white,
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
                    margin: EdgeInsets.only(top: 30, bottom:30),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SummaryPage(getCategory.text, getNotes.text, double.parse(getTotal.text))),
                        );
                      },
                      child: const Text('Add Expense'),
                    ),
                  ),
                ],
              )

        ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SummaryPage(getCategory.text, getNotes.text, 0)),
          );
        },
        child: Icon(Icons.format_list_bulleted),
      ), // This trailing comma makes auto-formatting nicer for build methods.


    );
  }
}


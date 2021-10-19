import 'package:flutter/material.dart';
import 'add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Open Sans'
      ),
      home: MyHomePage(title: 'My spending this month'),
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
  final textController = TextEditingController();

  void calculateRemaining() {
    final enteredNumber = double.parse(textController.text);
    setState(() {
      remain = enteredNumber - 5;
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
                      size: 35
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 60, top: 40),
                    width: 100,
                      child: TextField(
                        controller: textController,
                        style: TextStyle(fontSize: 23),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                            counterText: ""
                        ),
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
                          size: 35
                      ),
                    ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 8),
                    child: Text(
                      remain == null ? '0' : remain.toString(),
                      style: TextStyle(fontSize: 23),
                      textAlign: TextAlign.center,
                    ),
                  ),
                    Container(
                        child: (IconButton(
                          onPressed: calculateRemaining,
                          icon: Icon(Icons.refresh),
                        ))
                    )
                ]
              ),

          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.



    );
  }
}


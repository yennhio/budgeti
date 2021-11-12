import 'package:flutter/material.dart';
import 'main.dart';
import 'detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  SummaryPageState createState() => SummaryPageState();
}

class SummaryPageState extends State<SummaryPage> {


  Future<String?> getCategory() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('YourCategory');
  }

  Future<String?> getNotes() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('YourNote');
  }

  Future<double?> getTotal() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('YourTotal');
  }

  List<String> categ = [];
  List<String> notes = [];
  List<double> total = [];

  String jsonCateg = '';
  String jsonNotes = '';
  String jsonTotal = '';

  listToJson() {
    jsonCateg = jsonEncode(categ);
    jsonNotes = jsonEncode(notes);
    jsonTotal = jsonEncode(total);
  }

  jsonToList() {
    var dartCateg = jsonDecode(jsonCateg);
    categ = dartCateg != null ? List.from(dartCateg) : null!;

    var dartNotes = jsonDecode(jsonNotes);
    notes = dartNotes != null ? List.from(dartNotes) : null!;

    var dartTotal = jsonDecode(jsonTotal);
    total = dartTotal != null ? List.from(dartTotal) : null!;
  }

  setCard() {
    getCategory().then((value) {
      setState(() {
        categ.add(value!);
      });
    });

    getNotes().then((value) {
      setState(() {
        notes.add(value!);
      });
    });

    getTotal().then((value) {
      setState(() {
        total.add(value!);
      });
    });

    listToJson();
    saveCategArray();
    saveNotesArray();
    saveTotalArray();
    jsonToList();

  }

  Future<bool> saveCategArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourCategArray', jsonCateg);
  }

  Future<bool> saveNotesArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourNotesArray', jsonNotes);
  }

  Future<bool> saveTotalArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourTotalArray', jsonTotal);
  }

  @override
  void initState() {

    setCard();
  }

  Future<bool> saveRemaining() async {
    double remaining;
    double enteredIncome = double.parse(MyHomePageState().displayIncome);
    double totalSpent = 0;

    for (var i=0; i<total.length; i++)
      totalSpent = totalSpent + total[i];

    remaining = enteredIncome - totalSpent;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble('YourRemaining', remaining);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 150,
          flexibleSpace: Container(
              decoration: BoxDecoration(
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
          title: Text(
              'Your Spending Summary',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0
        ),
        body: Container(
          margin: EdgeInsets.only(top:30),
          child: ListView.builder(
              itemCount: categ.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(categ[index], notes[index], total[index])),
                    );
                  },
                  title: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 50),
                      child: Row(
                          children: [
                            Text(
                              '${categ[index]}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            Text(
                              '${total[index]}',
                              style: TextStyle(
                                  fontSize: 20),
                            )
                          ]
                      )

                  ),
                );
              }
          ),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          saveRemaining();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: '', incomeInput: '',)),
          );
        },
        elevation: 0,
        child: Icon(Icons.home_filled),

      ), //
    );
  }
}

import 'package:flutter/material.dart';
import 'main.dart';
import 'detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SummaryPage extends StatefulWidget {
  String categories;
  String noters;
  double totale;
  SummaryPage(this.categories, this.noters, this.totale);

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


  Future<bool> saveCategArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourCategArray', jsonCateg);
  }

  Future<String?> getCategArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('YourCategArray');
  }

  Future<bool> saveNotesArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourNotesArray', jsonNotes);
  }

  Future<String?> getNotesArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('YourNotesArray');
  }


  Future<bool> saveTotalArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('YourTotalArray', jsonTotal);
  }

  Future<String?> getTotalArray() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('YourTotalArray');
  }

  addCard() {

      getCategArray().then((value) {
          var dartCateg = jsonDecode(value!);
          categ = dartCateg != null ? List.from(dartCateg) : null!;

        if (widget.categories != '')
          categ.add(widget.categories);

        setState(() {
          this.categ = categ;
        });

        jsonCateg = jsonEncode(categ);
        saveCategArray();

      });


      getNotesArray().then((value) {
          var dartNotes = jsonDecode(value!);
          notes = dartNotes != null ? List.from(dartNotes) : null!;

        if (widget.noters != '') {
          notes.add(widget.noters);
        }

        setState(() {
          this.notes = notes;
        });

        jsonNotes = jsonEncode(notes);
        saveNotesArray();

    });


      getTotalArray().then((value) {
          var dartTotal = jsonDecode(value!);
          total = dartTotal != null ? List.from(dartTotal) : null!;


        if (widget.totale != 0) {
          total.add(widget.totale);
        }

        setState(() {
          this.total = total;
        });

        jsonTotal = jsonEncode(total);
        saveTotalArray();

      });



  }

  @override
  void initState() {
      addCard();
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
                  onLongPress: () {
                    setState(() {
                      categ.removeAt(index);
                      notes.removeAt(index);
                      total.removeAt(index);
                    });

                    jsonNotes = jsonEncode(notes);
                    saveNotesArray();
                    jsonCateg = jsonEncode(categ);
                    saveCategArray();
                    jsonTotal = jsonEncode(total);
                    saveTotalArray();

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: '', incomeInput: '')),
          );
        },
        elevation: 0,
        child: Icon(Icons.home_filled),

      ), //
    );
  }
}

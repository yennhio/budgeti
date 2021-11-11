import 'package:flutter/material.dart';
import 'expense.dart';
import 'main.dart';
import 'detail.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {


  List<String> type = ["insurance", "phone", "food", "hola"];
  List<String> noties = ["yesterday,,", "Nov 2", "McDonalds", "hb ice"];
  List<double> totl = [23, 100, 50, 40];



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
              itemCount: type.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(type[index], noties[index], totl[index])),
                    );
                  },
                  title: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 50),
                      child: Row(
                          children: [
                            Text(
                              '${type[index]}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            Text(
                              '${totl[index]}',
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
            MaterialPageRoute(builder: (context) => MyHomePage(title: '', incomeInput: '',)),
          );
        },
        elevation: 0,
        child: Icon(Icons.home_filled),

      ), //
    );
  }
}

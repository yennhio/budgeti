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

  List<Expense> expenses = <Expense>[];

  _SummaryPageState() {

    Expense e1 = Expense("McDonalds", "after school asdjslg salgkajs;dlg jasldgjsd adsgjsdlg sdgjlsdjjs glskd", 23.34);
    Expense e2 = Expense("Gas", "Chevron gas to mom's house", 50.20);

    expenses = [e1, e2];

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
              itemCount: expenses.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  onTap: (){
                    print('${expenses[index].notes}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(expenses[index])),
                    );
                  },
                  title: Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, bottom: 5, left: 50, right: 50),
                      child: Row(
                          children: [
                            Text(
                              '${expenses[index].category}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            Text(
                              '${expenses[index].total}',
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
          Navigator.pop(
            context
          );
        },
        elevation: 0,
        child: Icon(Icons.home_filled),

      ), //
    );
  }
}

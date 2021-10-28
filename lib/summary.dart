import 'package:flutter/material.dart';
import 'add.dart';
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
      body: Container(
        margin: EdgeInsets.only(top:50),
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
      )
    );
  }
}

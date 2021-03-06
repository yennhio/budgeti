import 'package:flutter/material.dart';
import 'main.dart';
import 'summary.dart';

class DetailPage extends StatefulWidget {
  String types;
  String noters;
  double amount;
  DetailPage(this.types, this.noters, this.amount);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
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
              Spacer()
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 50, right: 40, bottom: 10),
                child: Text("${widget.types}",
                  style: TextStyle(
                    fontSize: 20,
                      fontWeight: FontWeight.w700
                )),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 30, right: 50, bottom: 10),
                child: Text("${widget.amount}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  )
                )
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
              margin: EdgeInsets.only(top: 20, bottom: 50),
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    colors: [Colors.blue.shade100, Colors.blue.shade50]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),

            ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 50),
                width: 280,
                height: 200,
                child: Text("${widget.noters}",
                    style: TextStyle(
                        fontSize: 17
                    )
                ),
              )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(title: '', incomeInput: '',)),
                  );
                },
                icon: Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                    size: 35
                ),
              ),

              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryPage('', '', 0)),
                  );
                },
                icon: Icon(
                    Icons.format_list_bulleted,
                    color: Colors.grey,
                    size: 35
                ),
              )
            ],
          ),
        ]
      )
    );
  }
}

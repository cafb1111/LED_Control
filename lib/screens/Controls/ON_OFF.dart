import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  @override
  RealtimeDatabaseInsertState createState() => RealtimeDatabaseInsertState();
}

class RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
  Color LED_color = Colors.grey;

  final databaseRef = FirebaseDatabase(
      databaseURL:
          "https://app1-dd5b7-default-rtdb.asia-southeast1.firebasedatabase.app/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.symmetric(vertical: 50.0, horizontal: 150.0),
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              Icon(Icons.lightbulb_rounded, size: 50.0, color: LED_color),
              SizedBox(height: 50.0),
              ElevatedButton(
                  onPressed: () {
                    insertData('ON');
                    setColor();
                  },
                  child: Text("LED ON")),
              SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    insertData('OFF');
                    setColor();
                  },
                  child: Text("LED OFF")),
            ])));
  }

  void insertData(String LED) {
    databaseRef.reference().set({
      'LED': LED,
    });
  }

  void setColor() async {
    DataSnapshot Status = await databaseRef.reference().child("LED").once();

    // print(Status.value);

    if (Status.value == "ON") {
      setState(() {
        LED_color = Colors.green;
      });
      print(Status.value);
    }

    if (Status.value == "OFF") {
      setState(() {
        LED_color = Colors.grey;
      });
      print(Status.value);
    }
  }
}

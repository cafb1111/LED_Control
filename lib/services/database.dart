import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  @override
  RealtimeDatabaseInsertState createState() => RealtimeDatabaseInsertState();
}

class RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
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
              Icon(Icons.lightbulb_rounded, size: 50.0, color: Colors.grey),
              SizedBox(height: 50.0),
              ElevatedButton(
                  onPressed: () {
                    insertData('ON');
                    insertData('ON');
                  },
                  child: Text("LED ON")),
              SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    insertData('OFF');
                  },
                  child: Text("LED OFF")),
            ])));
  }

  void insertData(String LED) {
    databaseRef.reference().set({
      'LED': LED,
    });
    // print(LED);
    // print(databaseRef);
  }

  void setColor(String Color) async {
    DataSnapshot Status = await databaseRef.reference().child("LED").once();

    // print(Status.value);
    if (Status.value == "ON") {
      Color == "green";
    }
  }
}

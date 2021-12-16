import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/screens/Controls/ON_OFF.dart';
import 'package:flutter_application_1/screens/Controls/Brightness.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
            title: Text('Test'),
            backgroundColor: Colors.grey[100],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Log out'),
                  onPressed: () async {
                    await _auth.signOut();
                  })
            ]),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //LED On/Off
                children: [
              ElevatedButton(
                child: Text('LED On/Off'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[100],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RealtimeDatabaseInsert()));
                },
              ),

              //Brightness
              ElevatedButton(
                child: Text('Brightness'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[100],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BrightnessAdjustment()));
                },
              )
            ])));
  }
}

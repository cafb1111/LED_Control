import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class BrightnessAdjustment extends StatefulWidget {
  @override
  _BrightnessAdjustmentState createState() => _BrightnessAdjustmentState();
}

class _BrightnessAdjustmentState extends State<BrightnessAdjustment> {
  Color LED_color = Colors.grey;
  double _opacity = 0.00;

  final databaseRef = FirebaseDatabase(
      databaseURL:
          "https://app1-dd5b7-default-rtdb.asia-southeast1.firebasedatabase.app/");

  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adjust Brightness'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                Icon(Icons.lightbulb_outline, size: 40, color: LED_color
                    // color:
                    ),
                new Expanded(
                    child: Slider(
                        value: _value.toDouble(),
                        min: 1.0,
                        max: 50.0,
                        divisions: 5,
                        activeColor: Colors.green,
                        inactiveColor: Colors.orange,
                        label: 'Set brightness value',
                        onChanged: (double newValue) {
                          setState(() {
                            _value = newValue.round();
                          });

                          insertData(_value.toString());
                          Future.delayed(Duration(seconds: 3), () {
                            setColor();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        })),
              ])),
        ));
  }

  void insertData(String Brightness) {
    databaseRef.reference().set({
      'Brightness': Brightness,
    });
    print(Brightness);
  }

  void setColor() async {
    DataSnapshot Status =
        await databaseRef.reference().child('Brightness_Status').once();

    if (Status.value != "0") {
      setState(() {
        LED_color = Colors.green.withOpacity(0.5);
      });
      print(Status.value);
    }

    if (Status.value == "0") {
      setState(() {
        LED_color = Colors.grey;
      });
      print(Status.value);
    }
  }
}

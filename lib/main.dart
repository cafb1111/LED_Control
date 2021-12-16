import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/wrapper.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await FirebaseApp.allApps();
  // //  = await FirebaseApp.allApps();

  // runApp(MyApp());

  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      // value: null,
      value: AuthService().user,
      child: MaterialApp(
        title: 'Application',
        theme: ThemeData(primarySwatch: Colors.grey),
        // home: RealtimeDatabaseInsert(),
        home: Wrapper(),
      ),
    );
  }
}

// void send(){

// ServerSocket.bind('127.0.0.1', 4041)
//    .then((serverSocket) {
//     serverSocket.listen((socket) {
//       socket.transform(utf8).listen(print);
//      });
//   });

// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String txtOn = 'Press Led ON';
//   String txtOff = 'Press Led OFF';

//   void ledOn() { 
//     setState(() {
//       txtOn = 'ON';
//     });
//   }

//   void ledOff() {
//     setState(() {
//       txtOff = 'OFF';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       theme: ThemeData(primarySwatch: Colors.grey),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter layout demo'),
//         ),
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//               const SizedBox(width: 16),
//               Text('$txtOn'),
//               ElevatedButton(onPressed: ledOn, child: Text('Led ON')),

//               Text('$txtOff'),
//               ElevatedButton(onPressed: ledOff, child: Text('Led OFF')),

//               // ElevatedButton(onPressed: ledOn, child: Text('Led OFF')),
//             ])),
//       ),
//     );
//   }
// }

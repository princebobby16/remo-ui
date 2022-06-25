import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/views/transact.dart';
import 'package:momo_recorder_ui_app/src/views/home.dart';
import 'package:momo_recorder_ui_app/src/views/list.dart';
import 'package:momo_recorder_ui_app/src/views/login.dart';

void main() {
  runApp(const Remo());
}

class Remo extends StatelessWidget {
  const Remo({Key? key}) : super(key: key);

  /*
  This widget is the root of the [Way] application
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const Login(),
      initialRoute: '/',
      routes: {
        '/home': (context) => const RemoHome(),
        '/commissions': (context) => const RemoCommission(),
        '/view-transactions': (context) => const RemoViewTransactions(),
      },
    );
  }
}

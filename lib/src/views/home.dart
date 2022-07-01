import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/RemoAppBar.dart';
import 'package:momo_recorder_ui_app/src/components/bottom_navbar.dart';
import 'package:momo_recorder_ui_app/src/components/card.dart';
import 'package:momo_recorder_ui_app/src/views/transact.dart';
import 'package:momo_recorder_ui_app/src/views/home_page.dart';
import 'package:momo_recorder_ui_app/src/views/list.dart';

class RemoHome extends StatefulWidget {
  const RemoHome({Key? key}) : super(key: key);

  @override
  State<RemoHome> createState() => _RemoHomeState();
}

class _RemoHomeState extends State<RemoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RemoAppBar(title: 'Remo Transactions Recorder', implyLeading: false),
      extendBody: true,
      body: AnimatedContainer(
        height: double.infinity,
        duration: const Duration(seconds: 1),
        child: const SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: RemoHomePage()
        ),
      ),
      bottomNavigationBar: const RemoBottomNavBar(),
    );
  }
}
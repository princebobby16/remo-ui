import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/components/remo_app_bar.dart';
import 'package:momo_recorder_ui_app/src/components/bottom_navbar.dart';
import 'package:momo_recorder_ui_app/src/views/home_page.dart';

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
      body: Stack(
        children: [
          AnimatedContainer(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5)
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ])),
            curve: Curves.easeInSine,
            duration: const Duration(seconds: 1),
          ),
          AnimatedContainer(
            height: double.infinity,
            duration: const Duration(seconds: 1),
            child: const SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: RemoHomePage()
            ),
          ),
        ],
      ),
      bottomNavigationBar: const RemoBottomNavBar(),
    );
  }
}
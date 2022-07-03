import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RemoBottomNavBar extends StatefulWidget {
  const RemoBottomNavBar({Key? key}) : super(key: key);

  @override
  _RemoBottomNavBarState createState() => _RemoBottomNavBarState();
}

class _RemoBottomNavBarState extends State<RemoBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 7, right: 7),
        child: PhysicalModel(
          color: Colors.grey,
          // shadowColor: Colors.lightBlueAccent,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  // color: Color(0x7573f1e6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withAlpha(100),
                      spreadRadius: 5,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: const Icon(Icons.home), onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
                  IconButton(icon: const Icon(Icons.view_agenda), onPressed: () {
                    Navigator.pushNamed(context, '/transact');
                  }),
                  IconButton(icon: const Icon(Icons.list), onPressed: () {
                    Navigator.pushNamed(context, '/view-transactions');
                  })
                ],
              ),
            ),
          ),
        ));
  }
}


import 'package:flutter/material.dart';

class RemoAppBar extends StatelessWidget with PreferredSizeWidget {
  RemoAppBar({Key? key, required this.title, this.preferredSize= const Size.fromHeight(60.0), required this.implyLeading, this.backButton}) : super(key: key);

  @override
  final Size preferredSize;
  final String title;
  final bool implyLeading;
  Widget? backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      title: Text(title),
      backgroundColor: Colors.lightBlueAccent,
      leading: backButton,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.account_circle),
          tooltip: 'snack bar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        )
      ],
    );
  }
}

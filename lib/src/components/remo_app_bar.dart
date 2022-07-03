import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/services/authentication_service.dart';
import 'package:provider/provider.dart';

class RemoAppBar extends StatelessWidget with PreferredSizeWidget {
  RemoAppBar(
      {Key? key,
      required this.title,
      this.preferredSize = const Size.fromHeight(60.0),
      required this.implyLeading,
      this.backButton})
      : super(key: key);

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
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: PopupMenuButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'account',
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.settings, color: Colors.black),
                    Padding(padding: EdgeInsets.all(10), child: Text("Settings"))
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.share, color: Colors.black),
                    Padding(padding: EdgeInsets.all(10), child: Text("Share"))
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () => {
                  context.read<AuthenticationService>()
                      .signOut()
                  .then((value) => {
                    print(value),
                    Navigator.of(context).pushNamed("/")
                  })
                },
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.black),
                    Padding(padding: EdgeInsets.all(10), child: Text("Logout"))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

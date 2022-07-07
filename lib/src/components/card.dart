import 'package:flutter/material.dart';
import 'package:momo_recorder_ui_app/src/models/transaction.dart';

class RemoCard extends StatefulWidget {
  const RemoCard({Key? key, required this.title, required this.responseData})
      : super(key: key);

  final String title;
  final Future<TransactionsData> responseData;

  @override
  State<RemoCard> createState() => _RemoCardState();
}

class _RemoCardState extends State<RemoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        // shadowColor: Colors.lightBlueAccent,
        margin: const EdgeInsets.all(20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0x5573f1e6), width: 1)),
        child: FutureBuilder(
            future: widget.responseData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  TransactionsData data = snapshot.data as TransactionsData;
                  return _buildCardContent(
                      context, widget.title, data.date, data.value);
                }
              }
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(widget.title,
                            style: const TextStyle(fontSize: 22)),
                        subtitle: const Text(""),
                      ),
                    ),
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Center(
                            child: CircularProgressIndicator(
                                color: Colors.lightBlueAccent))),
                  ))
                ],
              );
            }));
  }
}

Widget _buildCardContent(BuildContext context, String title, String date, double value) {
  return Column(
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(title, style: const TextStyle(fontSize: 22)),
            subtitle: Text(date),
          ),
        ),
      ),
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title:
                Text(value.toString(), style: const TextStyle(fontSize: 25))),
      ))
    ],
  );
}

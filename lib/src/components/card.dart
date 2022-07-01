import 'package:flutter/material.dart';

class RemoCard extends StatefulWidget {
  const RemoCard({Key? key, required this.title, required this.subtitle, required this.value}) : super(key: key);

  final String title;
  final String subtitle;
  final String value;

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
            borderSide: const BorderSide(color: Color(0x5573f1e6), width: 1)
        ),
        child: SizedBox(
          height: 0.18 * MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(widget.title, style: const TextStyle(fontSize: 25)),
                    subtitle: Text(widget.subtitle),
                  ),
                ),
              ),
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(title: Text(widget.value, style: const TextStyle(fontSize: 25))),
              ))
            ],
          ),
        ));
  }
}


import 'package:flutter/material.dart';

class RemoInput extends StatefulWidget {
  const RemoInput({Key? key,
    required this.placeholder,
    this.icon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.hideText = false,
    required this.textEditingController,
  }) : super(key: key);

  final String placeholder;
  final bool enabled;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool hideText;
  final TextEditingController textEditingController;

  @override
  RemoState createState() => RemoState();
}

class RemoState extends State<RemoInput> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInSine,
      alignment: Alignment.centerLeft,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withAlpha(100),
              spreadRadius: 5,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: TextField(
        enabled: widget.enabled,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        obscureText: widget.hideText,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(widget.icon, color: Colors.white,),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(color: Colors.white70)
        ),
      ),
    );
  }
}
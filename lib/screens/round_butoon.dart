import 'package:flutter/material.dart';

class RoundButtonCustomWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const RoundButtonCustomWidget(
      {super.key, required this.title, required this.onTap});

  @override
  State<RoundButtonCustomWidget> createState() =>
      _RoundButtonCustomWidgetState();
}

class _RoundButtonCustomWidgetState extends State<RoundButtonCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.deepPurple),
        height: 50,
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

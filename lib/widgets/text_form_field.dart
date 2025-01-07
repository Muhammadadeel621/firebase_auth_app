import 'package:flutter/material.dart';

class TextFormFieldCustomWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController editingController;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  const TextFormFieldCustomWidget(
      {super.key,
      required this.hintText,
      required this.editingController,
      this.prefixIcon,
      this.suffixIcon});

  @override
  State<TextFormFieldCustomWidget> createState() =>
      _TextFormFieldCustomWidgetState();
}

class _TextFormFieldCustomWidgetState extends State<TextFormFieldCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.editingController,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? defaultText;
  final bool onlyText;
  const TextBox({
    Key? key,
    required this.controller,
    required this.label,
    this.defaultText,
    this.onlyText = false,
  }) : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  void initState() {
    super.initState();
    if (widget.defaultText != null) {
      widget.controller.text = widget.defaultText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          labelText: widget.label,
          suffix: GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              widget.controller.clear();
            },
          ),
        ),
        readOnly: widget.onlyText,
      ),
    );
  }
}

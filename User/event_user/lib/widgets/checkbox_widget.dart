import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final String label;
  final ValueChanged<bool?> onChanged;
  final bool isChecked;

  const MyCheckbox({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isChecked,
          onChanged: widget.onChanged,
          checkColor: Colors.white,
          activeColor: Colors.blue,
        ),
        Text(
          widget.label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

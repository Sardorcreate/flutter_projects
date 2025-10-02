import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const Inputs({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.label,
      ),
    );
  }
}
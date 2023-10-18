import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final bool isRequired;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final validator;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.label,
    this.isRequired = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator = null,
    this.obscureText = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),
          validator: (value) {
            if (widget.isRequired) {
              if (value == null || value.isEmpty) {
                return '${widget.label} is required';
              }
              if (widget.validator != null) {
                return widget.validator(value);
              }
            }

            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

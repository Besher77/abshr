import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom text field with localized labels, hints, and error messages
class CustomTextField extends StatelessWidget {
  final String labelKey;
  final String? hintKey;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.labelKey,
    this.hintKey,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      readOnly: readOnly,
      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      decoration: InputDecoration(
        labelText: labelKey.tr,
        hintText: hintKey?.tr,
        labelStyle: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
        hintStyle: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6)),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom dropdown field with localized labels
class CustomDropdown<T> extends StatelessWidget {
  final String labelKey;
  final String? hintKey;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdown({
    super.key,
    required this.labelKey,
    this.hintKey,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      decoration: InputDecoration(
        labelText: labelKey.tr,
        hintText: hintKey?.tr,
        labelStyle: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
        hintStyle: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6)),
      ),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      icon: Icon(Icons.arrow_drop_down, color: Theme.of(context).textTheme.bodySmall?.color),
    );
  }
}


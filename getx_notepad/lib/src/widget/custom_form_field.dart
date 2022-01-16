import 'package:flutter/material.dart';

Widget rederTextFormField(
    {String? initialValue,
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator}) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          maxLines: null,
          initialValue: initialValue ?? '',
        ),
        const SizedBox(height: 15.0),
      ]
  );
}

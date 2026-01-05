import 'package:flutter/material.dart';

class InputValidationBox extends StatelessWidget {
  const InputValidationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Account Name",
        labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> state) {
          final Color color = state.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.orange;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
      ),
      validator: (String? value) {
        if (value == null || value == "") {
          return "Enter name";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}

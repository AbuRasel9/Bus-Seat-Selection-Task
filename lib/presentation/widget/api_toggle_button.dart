import 'package:flutter/material.dart';
import 'dart:math' as math;

// 1️⃣ API Toggle Widget
class ApiToggle extends StatelessWidget {
  final bool useApi1;
  final ValueChanged<bool> onChanged;

  const ApiToggle({super.key, required this.useApi1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "API 2",
          style: TextStyle(
            color: useApi1 ? Colors.grey : Theme.of(context).colorScheme.primary,
          ),
        ),
        Switch(
          value: useApi1,
          onChanged: onChanged,
        ),
        Text(
          "API 1",
          style: TextStyle(
            color: useApi1 ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
        ),
      ],
    );
  }
}


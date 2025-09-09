// lib/presentation/widgets/driver_widget.dart
import 'package:bus_seat_selection/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: 15,),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.outline,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(
        "assets/images/steering-wheel.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: theme.colorScheme.onPrimary,
      ),    );
  }
}

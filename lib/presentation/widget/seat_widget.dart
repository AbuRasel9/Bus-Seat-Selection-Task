import 'package:bus_seat_selection/utils/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10, bottom: 10,top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: theme.colorScheme.outline.withOpacity(.4),
      ),
      child: Text(
        name,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

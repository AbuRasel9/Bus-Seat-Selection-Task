import 'package:bus_seat_selection/utils/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6,),
        color: theme.colorScheme.outline.withOpacity(.4),
      ),
      child: Text(
        name,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          
        ),
      ),
    );
  }
}

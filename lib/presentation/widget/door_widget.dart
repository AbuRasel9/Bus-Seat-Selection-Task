import 'package:bus_seat_selection/utils/extensions/context_ext.dart';
import 'package:flutter/cupertino.dart';

class DoorWidget extends StatelessWidget {
  const DoorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(right: 17,),

      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.outline,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(
        "assets/images/bus_door_icon.png",
        height: 20,
        width: 20,
        fit: BoxFit.fill,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }
}

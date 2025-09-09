import 'dart:math' as math;

import 'package:bus_seat_selection/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_bloc.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_event.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_state.dart';
import '../widget/api_toggle_button.dart';
import '../widget/door_widget.dart';
import '../widget/driver_widget.dart';
import '../widget/seat_grid.dart';
import '../widget/seat_widget.dart';
import '../widget/space_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool useApi1 = true;

  @override
  void initState() {
    super.initState();
    _loadSeats();
  }

  void _loadSeats() {
    context.read<BusSeatBloc>().add(LoadSeats(useApi1: useApi1));
  }

  Widget buildItem(dynamic item) {
    if (item == null) return const SpaceWidget();

    switch (item['type']) {
      case 'seat':
        return SeatWidget(
          name: item['name'] ?? "",

        );
      case 'driver':
        return const DriverWidget();
      case 'door':
        return const DoorWidget();
      default:
        return const SpaceWidget();
    }
  }




  @override
  Widget build(BuildContext context) {
    final theme=context.theme;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Bus Seat Layout",style: theme.textTheme.bodyMedium?.copyWith(/*color: theme.colorScheme.*/),),
        actions: [
          ApiToggle(
          useApi1: useApi1,
          onChanged: (val) {
            setState(() => useApi1 = val);
            _loadSeats();
          },
        ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<BusSeatBloc, BusSeatState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error: ${state.message}")),
              );
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == Status.success) {
              return SeatGrid(
                rows: state.seatItemList,
                buildItem: (item) => buildItem(item), // your seat widget
                seatSpacing: 30.0, // optional
              );
            } else if (state.status == Status.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error: ${state.message}"),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadSeats,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
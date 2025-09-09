import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_bloc.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_event.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_state.dart';
import '../widget/door_widget.dart';
import '../widget/driver_widget.dart';
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

  Widget _buildApiToggle() {
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
          onChanged: (val) {
            setState(() => useApi1 = val);
            _loadSeats();
          },
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

  Widget _buildSeatLayout(List<dynamic> rows) {
    // Calculate max columns for consistent layout
    final maxCols = _calculateMaxColumns(rows);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows.map<Widget>((row) {
          if (row is List) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((item) => buildItem(item)).toList(),
            );
          } else if (row is Map) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(maxCols, (index) {
                final key = index.toString();
                return row.containsKey(key) ? buildItem(row[key]) : const SpaceWidget();
              }),
            );
          }
          return const SizedBox.shrink();
        }).toList(),
      ),
    );
  }

  int _calculateMaxColumns(List<dynamic> rows) {
    int maxCols = 0;

    for (var row in rows) {
      if (row is List) {
        maxCols = math.max(maxCols, row.length);
      } else if (row is Map) {
        final maxKey = row.keys
            .map((k) => int.tryParse(k) ?? 0)
            .fold(0, (a, b) => a > b ? a : b);
        maxCols = math.max(maxCols, maxKey + 1);
      }
    }

    return maxCols;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus Seat Layout"),
        actions: [_buildApiToggle()],
      ),
      body: BlocConsumer<BusSeatBloc, BusSeatState>(
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
            return _buildSeatLayout(state.seatItemList);
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
    );
  }
}
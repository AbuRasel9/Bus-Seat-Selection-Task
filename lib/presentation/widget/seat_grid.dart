import 'package:flutter/material.dart';
import 'dart:math' as math;

class SeatGrid extends StatelessWidget {
  final List<dynamic> rows;
  final Widget Function(dynamic item) buildItem;
  final double seatSpacing; // optional spacing for empty seats

  const SeatGrid({
    super.key,
    required this.rows,
    required this.buildItem,
    this.seatSpacing = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    final maxCols = _calculateMaxColumns(rows);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows.map<Widget>((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildRowItems(row, maxCols),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildRowItems(dynamic row, int maxCols) {
    if (row is List) {
      return row.map((item) => buildItem(item)).toList();
    } else if (row is Map) {
      return List.generate(maxCols, (index) {
        final key = index.toString();
        return row.containsKey(key)
            ? buildItem(row[key])
            : SizedBox(width: seatSpacing, height: seatSpacing);
      });
    }
    return [];
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
}

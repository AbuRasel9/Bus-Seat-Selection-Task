import 'package:bus_seat_selection/models/bus_seat_selection_model/seat_data.dart';
import 'package:bus_seat_selection/models/bus_seat_selection_model/seat_item_model.dart';
import 'package:equatable/equatable.dart';

enum Status { initial, loading, success, error }

class BusSeatState extends Equatable {
  final List<dynamic> seatItemList;
  final Status status;
  final String message;

  const BusSeatState({
    this.status = Status.initial,
    this.message = "",
    this.seatItemList = const [],
  });

  BusSeatState copyWith({
    List<dynamic>? seatItemList,
    Status? status,
    String? message,
  }) {
    return BusSeatState(
      seatItemList: seatItemList ?? this.seatItemList,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status,message,seatItemList];
}

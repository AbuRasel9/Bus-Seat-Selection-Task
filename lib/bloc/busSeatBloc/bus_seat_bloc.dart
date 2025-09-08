import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_event.dart';
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_state.dart';
import 'package:bus_seat_selection/repositories/bus_layout_repo/bus_seat_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusSeatBloc extends Bloc<BusSeatEvent, BusSeatState> {
  final BusSeatRepo busSeatRepo;

  BusSeatBloc({required this.busSeatRepo}) : super(const BusSeatState()) {
    on<LoadSeats>(_getSeatList);
  }

  Future<void> _getSeatList(LoadSeats event, Emitter<BusSeatState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await busSeatRepo.busSeatApi(event.useApi1);
      emit(state.copyWith(
        seatItemList: response.record?.data ?? [],
        status: Status.success,
        message: "",
      ));
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        print(error);
      }
      emit(state.copyWith(
        status: Status.error,
        message: error.toString(),
      ));
    }
  }
}

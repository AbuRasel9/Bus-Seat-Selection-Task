import 'package:equatable/equatable.dart';

abstract class BusSeatEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadSeats extends BusSeatEvent{
  final bool useApi1;
  LoadSeats({required this.useApi1});

  @override
  List<Object?> get props => [useApi1];
}
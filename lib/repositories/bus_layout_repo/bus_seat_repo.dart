import 'package:bus_seat_selection/models/bus_seat_selection_model/seat_item_model.dart';

abstract class BusSeatRepo{
  ///fetches the list of movies form the api
  ///returns a  [SeatItemModel] representing the list of seat item
  Future<SeatItemModel>busSeatApi(bool useApi1);
}
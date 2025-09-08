import 'package:bus_seat_selection/models/bus_seat_selection_model/seat_data.dart';

class Record {
  List<SeatData>? data;

  Record({
    this.data,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    data: json["data"] == null
        ? []
        : List<SeatData>.from(json["data"]!.map((x) => SeatData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}


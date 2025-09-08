// To parse this JSON data, do
//
//     final seatItemModel = seatItemModelFromJson(jsonString);

import 'dart:convert';
import 'record_model.dart';
import 'meta_data_model.dart';

SeatItemModel seatItemModelFromJson(String str) => SeatItemModel.fromJson(json.decode(str));

String seatItemModelToJson(SeatItemModel data) => json.encode(data.toJson());

class SeatItemModel {
  Record? record;
  Metadata? metadata;

  SeatItemModel({
    this.record,
    this.metadata,
  });

  factory SeatItemModel.fromJson(Map<String, dynamic> json) => SeatItemModel(
    record: json["record"] == null ? null : Record.fromJson(json["record"]),
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "record": record?.toJson(),
    "metadata": metadata?.toJson(),
  };
}




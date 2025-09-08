class Record {
  List<dynamic>? data;

  Record({
    this.data,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}

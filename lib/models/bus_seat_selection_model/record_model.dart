class Record {
  List<dynamic> data;

  Record({required this.data});

  factory Record.fromJson(Map<String, dynamic> json) {
    final rawData = json["data"];
    if (rawData is List) {
      return Record(data: rawData);
    }
    return Record(data: []);
  }

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}

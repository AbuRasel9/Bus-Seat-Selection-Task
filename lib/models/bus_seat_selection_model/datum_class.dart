class DatumClass {
  String? type;
  String? name;

  DatumClass({
    this.type,
    this.name,
  });

  factory DatumClass.fromJson(Map<String, dynamic> json) => DatumClass(
    type: json["type"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
  };
}

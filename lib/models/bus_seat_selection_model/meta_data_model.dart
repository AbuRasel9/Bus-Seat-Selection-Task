class Metadata {
  String? id;
  bool? private;
  DateTime? createdAt;

  Metadata({
    this.id,
    this.private,
    this.createdAt,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    id: json["id"]?.toString(),
    private: json["private"] ?? false,
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.tryParse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "private": private,
    "createdAt": createdAt?.toIso8601String(),
  };
}

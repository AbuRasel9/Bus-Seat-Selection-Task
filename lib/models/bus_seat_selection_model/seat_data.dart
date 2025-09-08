class SeatData {
  final String type;
  final String? name;

  SeatData({required this.type, this.name});

  factory SeatData.fromJson(Map<String, dynamic> json) {
    return SeatData(
      type: json['type'] ?? 'space',
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
    };
  }
}
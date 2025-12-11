class RegencyModel {
  final String id;
  final String name;

  RegencyModel({required this.id, required this.name});

  factory RegencyModel.fromJson(Map<String, dynamic> json) {
    return RegencyModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
    );
  }
}

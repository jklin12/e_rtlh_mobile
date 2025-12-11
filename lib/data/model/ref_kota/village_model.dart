class VillageModel {
  final String id;
  final String name;

  VillageModel({required this.id, required this.name});

  factory VillageModel.fromJson(Map<String, dynamic> json) {
    return VillageModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
    );
  }
}

import 'user_model.dart';

class BeritaModel {
  final int beritaId;
  final String? title;
  final String? image;
  final String? description;
  final String? banner;
  final String? targetUrl;
  DateTime? createdAt;

  UserModel? creator;

  BeritaModel(
      {required this.beritaId,
      this.title,
      this.image,
      this.description,
      this.banner,
      this.targetUrl,
      this.createdAt,
      this.creator});

  factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
        beritaId: json["berita_id"],
        title: json["title"] ?? '-',
        image: json["image"] ?? '-',
        description: json["description"] ?? '-',
        banner: json["banner"] ?? '-',
        targetUrl: json["target_url"] ?? '-',
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        creator: json["creator"] != null
            ? UserModel.fromJson(json["creator"])
            : null,
      );
}

class BannerModel {
  final int beritaId;
  final String? title;
  final String? image;
  final String? description;
  final String? banner;
  final String? targetUrl;

  BannerModel({
    required this.beritaId,
    this.title,
    this.image,
    this.description,
    this.banner,
    this.targetUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        beritaId: json["berita_id"],
        title: json["title"] ?? '-',
        image: json["image"] ?? '-',
        description: json["description"] ?? '-',
        banner: json["banner"] ?? '-',
        targetUrl: json["target_url"] ?? '-',
      );
}

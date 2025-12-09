class LaporanFotoModel {
  int laporanFotoId;
  int laporanId;
  String path;
  String keterangan;
  int createdBy;
  int? updatedBy;
  String createdAt;
  String updatedAt;

  LaporanFotoModel({
    required this.laporanFotoId,
    required this.laporanId,
    required this.path,
    required this.keterangan,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LaporanFotoModel.fromJson(Map<String, dynamic> json) => LaporanFotoModel(
        laporanFotoId: json["laporan_foto_id"],
        laporanId: json["laporan_id"],
        path: json["path"],
        keterangan: json["keterangan"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "laporan_foto_id": laporanFotoId,
        "laporan_id": laporanId,
        "path": path,
        "keterangan": keterangan,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

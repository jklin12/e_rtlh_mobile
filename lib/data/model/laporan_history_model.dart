import 'user_model.dart';

class LaporanHistoryModel {
  int historyLaporanId;
  int laporanId;
  String status;
  String keterangan;
  int createdBy;
  int? updatedBy;
  String createdAt;
  String updatedAt;
  UserModel? creator;

  LaporanHistoryModel({
    required this.historyLaporanId,
    required this.laporanId,
    required this.status,
    required this.keterangan,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.creator,
  });

  factory LaporanHistoryModel.fromJson(Map<String, dynamic> json) => LaporanHistoryModel(
        historyLaporanId: json["history_laporan_id"],
        laporanId: json["laporan_id"],
        status: json["status"],
        keterangan: json["keterangan"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        creator: json["creator"] != null
            ? UserModel.fromJson(json["creator"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "history_laporan_id": historyLaporanId,
        "laporan_id": laporanId,
        "status": status,
        "keterangan": keterangan,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "creator": creator?.toJson(),
      };
}


// To parse this JSON data, do
//
//     final laporanModel = laporanModelFromJson(jsonString);

import 'dart:convert';

import 'laporan_detail_model.dart';
import 'laporan_foto_model.dart';
import 'laporan_history_model.dart';
import 'user_model.dart';

List<LaporanModel> laporanModelFromJson(String str) => List<LaporanModel>.from(
    json.decode(str).map((x) => LaporanModel.fromJson(x)));

String laporanModelToJson(List<LaporanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaporanModel {
  int? laporanId;
  int? userId;
  dynamic surveyorId;
  String? nomorUrutRumahTangga;
  String? kabupaten;
  String? kecamatan;
  String? desa;
  String? alamat;
  String? namaKepalaRumahTangga;
  String? jenisKelaminKrt;
  int? umurKrt;
  int? jumlahAnggotaRt;
  int? jumlahKeluarga;
  String? status;
  int? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  LaporanDetailModel? detail; // Nullable
  List<LaporanHistoryModel>? history; // Nullable
  List<LaporanFotoModel>? foto; // Nullable
  UserModel? user; // Nullable
  UserModel? surveyor;

  LaporanModel({
    this.laporanId,
    this.userId,
    this.surveyorId,
    this.nomorUrutRumahTangga,
    this.kabupaten,
    this.kecamatan,
    this.desa,
    this.alamat,
    this.namaKepalaRumahTangga,
    this.jenisKelaminKrt,
    this.umurKrt,
    this.jumlahAnggotaRt,
    this.jumlahKeluarga,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.detail,
    this.history,
    this.foto,
    this.user,
    this.surveyor,
  });

  factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
        laporanId: json["laporan_id"],
        userId: json["user_id"],
        surveyorId: json["surveyor_id"],
        nomorUrutRumahTangga: json["nomor_urut_rumah_tangga"],
        kabupaten: json["kabupaten"],
        kecamatan: json["kecamatan"],
        desa: json["desa"],
        alamat: json["alamat"],
        namaKepalaRumahTangga: json["nama_kepala_rumah_tangga"],
        jenisKelaminKrt: json["jenis_kelamin_krt"],
        umurKrt: json["umur_krt"],
        jumlahAnggotaRt: json["jumlah_anggota_rt"],
        jumlahKeluarga: json["jumlah_keluarga"],
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        detail: json["detail"] != null
            ? LaporanDetailModel.fromJson(json["detail"])
            : null,
        history: json["history"] != null
            ? List<LaporanHistoryModel>.from(
                json["history"].map((x) => LaporanHistoryModel.fromJson(x)))
            : null,
        foto: json["foto"] != null
            ? List<LaporanFotoModel>.from(
                json["foto"].map((x) => LaporanFotoModel.fromJson(x)))
            : null,
        user: json["user"] != null ? UserModel.fromJson(json["user"]) : null,
        surveyor: json["surveyor"] != null
            ? UserModel.fromJson(json["surveyor"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "laporan_id": laporanId,
        "user_id": userId,
        "surveyor_id": surveyorId,
        "nomor_urut_rumah_tangga": nomorUrutRumahTangga,
        "kabupaten": kabupaten,
        "kecamatan": kecamatan,
        "desa": desa,
        "alamat": alamat,
        "nama_kepala_rumah_tangga": namaKepalaRumahTangga,
        "jenis_kelamin_krt": jenisKelaminKrt,
        "umur_krt": umurKrt,
        "jumlah_anggota_rt": jumlahAnggotaRt,
        "jumlah_keluarga": jumlahKeluarga,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

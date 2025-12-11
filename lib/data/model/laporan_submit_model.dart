// To parse this JSON data, do
//
//     final laporanSubmitModel = laporanSubmitModelFromJson(jsonString);

import 'dart:convert';

LaporanSubmitModel laporanSubmitModelFromJson(String str) => LaporanSubmitModel.fromJson(json.decode(str));

String laporanSubmitModelToJson(LaporanSubmitModel data) => json.encode(data.toJson());

class LaporanSubmitModel {
    String? nomorUrutRumahTangga;
    String? kabupaten;
    String? kecamatan;
    String? desa;
    String? alamat;
    String? namaKepalaRumahTangga;
    String? jenisKelaminKrt;
    String? umurKrt;
    String? jumlahAnggotaRt;
    String? jumlahKeluarga;
    String? status;
    int? userId; 
    int? laporanId;

    LaporanSubmitModel({
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
        this.userId, 
        this.laporanId,
    });

    factory LaporanSubmitModel.fromJson(Map<String, dynamic> json) => LaporanSubmitModel(
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
        userId: json["user_id"], 
        laporanId: json["laporan_id"],
    );

    Map<String, dynamic> toJson() => {
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
        "user_id": userId, 
        "laporan_id": laporanId,
    };
}

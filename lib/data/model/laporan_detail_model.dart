class LaporanDetailModel {
  String? statusKesejahteraan;
  String? pendidikanTertinggi;
  String? lapanganUsaha;
  String? statusKedudukanPekerjaan;
  String? menggunakanTabung55;
  String? statusTabungGas;
  String? statusBangunan;
  String? jenisLantaiTerluas;
  String? jenisDindingTerluas;
  String? jenisAtapTerluas;
  String? milikSendiri;
  String? lantaiTidakLayak;
  String? dindingTidakLayak;
  String? atapTidakLayak;
  String? kondisiRtlh;
  String? prioritasRtlh;
  String? sumberAirMinum;
  String? sumberPenerangan;
  String? dayaListrik;
  String? bahanBakarMemasak;
  String? penggunaanFasilitasBab;
  String? jenisKloset;
  String? tempatPembuanganTinja;
  String? nomorUrutArtWus;
  String? usiaKawinSuamiWus;
  String? usiaKawinIstriWus;
  String? pesertaKbWus;
  String? metodeKontrasepsiWus;
  String? lamaKontrasepsiWus;
  DateTime? createdAt;

  LaporanDetailModel({
    this.statusKesejahteraan,
    this.pendidikanTertinggi,
    this.lapanganUsaha,
    this.statusKedudukanPekerjaan,
    this.menggunakanTabung55,
    this.statusTabungGas,
    this.statusBangunan,
    this.jenisLantaiTerluas,
    this.jenisDindingTerluas,
    this.jenisAtapTerluas,
    this.milikSendiri,
    this.lantaiTidakLayak,
    this.dindingTidakLayak,
    this.atapTidakLayak,
    this.kondisiRtlh,
    this.prioritasRtlh,
    this.sumberAirMinum,
    this.sumberPenerangan,
    this.dayaListrik,
    this.bahanBakarMemasak,
    this.penggunaanFasilitasBab,
    this.jenisKloset,
    this.tempatPembuanganTinja,
    this.nomorUrutArtWus,
    this.usiaKawinSuamiWus,
    this.usiaKawinIstriWus,
    this.pesertaKbWus,
    this.metodeKontrasepsiWus,
    this.lamaKontrasepsiWus,
    this.createdAt,
  });

  factory LaporanDetailModel.fromJson(Map<String, dynamic> json) =>
      LaporanDetailModel(
        statusKesejahteraan: json["status_kesejahteraan"],
        pendidikanTertinggi: json["pendidikan_tertinggi"],
        lapanganUsaha: json["lapangan_usaha"],
        statusKedudukanPekerjaan: json["status_kedudukan_pekerjaan"],
        menggunakanTabung55: json["menggunakan_tabung_55"],
        statusTabungGas: json["status_tabung_gas"],
        statusBangunan: json["status_bangunan"],
        jenisLantaiTerluas: json["jenis_lantai_terluas"],
        jenisDindingTerluas: json["jenis_dinding_terluas"],
        jenisAtapTerluas: json["jenis_atap_terluas"],
        milikSendiri: json["milik_sendiri"],
        lantaiTidakLayak: json["lantai_tidak_layak"],
        dindingTidakLayak: json["dinding_tidak_layak"],
        atapTidakLayak: json["atap_tidak_layak"],
        kondisiRtlh: json["kondisi_rtlh"],
        prioritasRtlh: json["prioritas_rtlh"],
        sumberAirMinum: json["sumber_air_minum"],
        sumberPenerangan: json["sumber_penerangan"],
        dayaListrik: json["daya_listrik"],
        bahanBakarMemasak: json["bahan_bakar_memasak"],
        penggunaanFasilitasBab: json["penggunaan_fasilitas_bab"],
        jenisKloset: json["jenis_kloset"],
        tempatPembuanganTinja: json["tempat_pembuangan_tinja"],
        nomorUrutArtWus: json["nomor_urut_art_wus"],
        usiaKawinSuamiWus: json["usia_kawin_suami_wus"],
        usiaKawinIstriWus: json["usia_kawin_istri_wus"],
        pesertaKbWus: json["peserta_kb_wus"],
        metodeKontrasepsiWus: json["metode_kontrasepsi_wus"],
        lamaKontrasepsiWus: json["lama_kontrasepsi_wus"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "status_kesejahteraan": statusKesejahteraan,
        "pendidikan_tertinggi": pendidikanTertinggi,
        "lapangan_usaha": lapanganUsaha,
        "status_kedudukan_pekerjaan": statusKedudukanPekerjaan,
        "menggunakan_tabung_55": menggunakanTabung55,
        "status_tabung_gas": statusTabungGas,
        "status_bangunan": statusBangunan,
        "jenis_lantai_terluas": jenisLantaiTerluas,
        "jenis_dinding_terluas": jenisDindingTerluas,
        "jenis_atap_terluas": jenisAtapTerluas,
        "milik_sendiri": milikSendiri,
        "lantai_tidak_layak": lantaiTidakLayak,
        "dinding_tidak_layak": dindingTidakLayak,
        "atap_tidak_layak": atapTidakLayak,
        "kondisi_rtlh": kondisiRtlh,
        "prioritas_rtlh": prioritasRtlh,
        "sumber_air_minum": sumberAirMinum,
        "sumber_penerangan": sumberPenerangan,
        "daya_listrik": dayaListrik,
        "bahan_bakar_memasak": bahanBakarMemasak,
        "penggunaan_fasilitas_bab": penggunaanFasilitasBab,
        "jenis_kloset": jenisKloset,
        "tempat_pembuangan_tinja": tempatPembuanganTinja,
        "nomor_urut_art_wus": nomorUrutArtWus,
        "usia_kawin_suami_wus": usiaKawinSuamiWus,
        "usia_kawin_istri_wus": usiaKawinIstriWus,
        "peserta_kb_wus": pesertaKbWus,
        "metode_kontrasepsi_wus": metodeKontrasepsiWus,
        "lama_kontrasepsi_wus": lamaKontrasepsiWus,
      };
}

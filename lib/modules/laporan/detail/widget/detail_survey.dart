import 'package:e_rtlh_mobile/data/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/formater.dart';
import '../../../../core/utils/styles.dart';
import '../../../../data/model/laporan_detail_model.dart';

class DetailSurvey extends StatelessWidget {
  const DetailSurvey(
      {super.key, required this.laporanDetailModel, required this.surveyor});
  final LaporanDetailModel laporanDetailModel;
  final UserModel? surveyor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Detail Survey",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              buildRowData("Status Kesejahteraan",
                  laporanDetailModel.statusKesejahteraan ?? ''),
              buildRowData("Pendidikan Tertinggi",
                  laporanDetailModel.pendidikanTertinggi ?? ''),
              buildRowData(
                  "Lapangan Usaha", laporanDetailModel.lapanganUsaha ?? ''),
              buildRowData("Status Kedudukan Pekerjaan",
                  laporanDetailModel.statusKedudukanPekerjaan ?? ''),
              buildRowData("Menggunakan Tabung Gas 3KG",
                  laporanDetailModel.menggunakanTabung55 ?? ''),
              buildRowData("Status Tabung Gas",
                  laporanDetailModel.statusTabungGas ?? ''),
              buildRowData(
                  "Status Bangunan", laporanDetailModel.statusBangunan ?? ''),
              buildRowData("Jenis Lantai Terluas",
                  laporanDetailModel.jenisLantaiTerluas ?? ''),
              buildRowData("Jenis Atap Terluas",
                  laporanDetailModel.jenisAtapTerluas ?? ''),
              buildRowData(
                  "Milik Sendiri", laporanDetailModel.lantaiTidakLayak ?? ''),
              buildRowData("Lantai tidak layak",
                  laporanDetailModel.dindingTidakLayak ?? ''),
              buildRowData("Dinding Tidak Layak",
                  laporanDetailModel.statusKesejahteraan ?? ''),
              buildRowData(
                  "Atap Tidak Layak", laporanDetailModel.atapTidakLayak ?? ''),
              buildRowData(
                  "Kondisi RTLH", laporanDetailModel.kondisiRtlh ?? ''),
              buildRowData(
                  "Prioritas RTLH", laporanDetailModel.prioritasRtlh ?? ''),
              buildRowData(
                  "Sumber Air Minum", laporanDetailModel.sumberAirMinum ?? ''),
              buildRowData("Sumber Penerangan",
                  laporanDetailModel.sumberPenerangan ?? ''),
              buildRowData(
                  "Daya Listrik", laporanDetailModel.dayaListrik ?? ''),
              buildRowData("Bahan Bakar Memasak",
                  laporanDetailModel.bahanBakarMemasak ?? ''),
              buildRowData("Penggunaan Fasilitas BAB",
                  laporanDetailModel.penggunaanFasilitasBab ?? ''),
              buildRowData(
                  "Jenis Kloset", laporanDetailModel.jenisKloset ?? ''),
              buildRowData("Tempat Pembuangan Tinja",
                  laporanDetailModel.tempatPembuanganTinja ?? ''),
              buildRowData(
                  "Nomor Urut WUS", laporanDetailModel.nomorUrutArtWus ?? ''),
              buildRowData("Usia Kawin Suami WUS",
                  laporanDetailModel.usiaKawinSuamiWus ?? ''),
              buildRowData("Usia Kawin Istri WUS",
                  laporanDetailModel.usiaKawinIstriWus ?? ''),
              buildRowData(
                  "Peserta KB WUS", laporanDetailModel.pesertaKbWus ?? ''),
              buildRowData("Metode KB WUS",
                  laporanDetailModel.metodeKontrasepsiWus ?? ''),
              buildRowData(
                  "Lama KB WUS", laporanDetailModel.lamaKontrasepsiWus ?? ''),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 12,
                width: double.infinity,
                color: colorSolitude,
              ),
              surveyor != null ? surveyorWidget() : SizedBox.shrink(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget surveyorWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
                height: 8,
              ),
        Text(
          "Surveyor",
          style: subTitleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        buildRowData("Nama", surveyor!.name ?? ''),
        buildRowData("Email", surveyor!.email ?? ''),
        buildRowData("Telepon", surveyor!.phone ?? ''),
         buildRowData("Tanggal Survey",
              convertToIndonesianFormatFromDateTime(laporanDetailModel.createdAt!)),
      ],
    );
  }

  Widget buildRowData(String label, String data) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: contentStyle),
            Expanded(
              child:
                  Text(data, textAlign: TextAlign.end, style: valueTextStyle),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}

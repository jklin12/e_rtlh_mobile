import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/formater.dart';
import '../../../../core/utils/styles.dart';
import '../../../../data/model/laporan_model.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.laporanModel});
  final LaporanModel laporanModel;

  Color getStatusColor(String status) {
    switch (status) {
      case "disetujui":
        return Colors.green;
      case "ditolak":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nomor Laporan", style: subTitleStyle),
                  const SizedBox(height: 5),
                  Text(
                    "${laporanModel.laporanId}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: colorPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: getStatusColor(laporanModel.status ?? "-")
                      .withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  (laporanModel.status ?? "-")
                      .replaceAll("_", " ")
                      .toUpperCase(),
                  style: TextStyle(
                    color: getStatusColor(laporanModel.status ?? "-"),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          buildRowData("Tanggal Lapor",
              convertToIndonesianFormatFromDateTime(laporanModel.createdAt!)),
          buildRowData("Nomor Rumah", laporanModel.nomorUrutRumahTangga ?? '-'),
          buildRowData("Kabupaten", laporanModel.kabupaten ?? '-'),
          buildRowData("Kecamatan", laporanModel.kecamatan ?? '-'),
          buildRowData("Desa", laporanModel.desa ?? '-'),
          buildRowData("Alamat", laporanModel.alamat ?? '-'),
          buildRowData("Nama Kepala Rumah Tangga",
              laporanModel.namaKepalaRumahTangga ?? '-'),
          buildRowData("Jenis Kelamin Kepala Rumah Tangga",
              laporanModel.jenisKelaminKrt ?? '-'),
          buildRowData(
              "Umur Kepala Rumah Tangga", "${laporanModel.umurKrt ?? '-'}"),
          buildRowData("Jumlah Anggota Keluarga",
              "${laporanModel.jumlahAnggotaRt ?? '-'}"),
          buildRowData(
              "Jumlah Keluarga", "${laporanModel.jumlahKeluarga ?? '-'}"),
          Divider(
            color: colorPrimary,
          ),
          Text(
            "Pelapor",
            style: subTitleStyle,
          ),
          SizedBox(
            height: 8,
          ),
          buildRowData("Nama", laporanModel.user!.name),
          buildRowData("Email", laporanModel.user!.email),
          buildRowData("Telepon", laporanModel.user!.phone),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget buildRowData(String label, String data) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: colorGreyLight,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child:
                  Text(data, textAlign: TextAlign.end, style: valueTextStyle),
            ),
          ],
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/formater.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widget/primary_button.dart';
import '../../../../data/model/laporan_model.dart';
import 'detail_survey.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.laporanModel});
  final LaporanModel laporanModel;

  Color getStatusColor(String status) {
    switch (status) {
      case "menunggu_verifikasi":
        return colorWarning;
      case "proses_survey":
        return colorSecondary;
      case "selesai_survey":
        return colorPrimary;
      case "diverifikasi_admin":
        return colorSuccess;
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
          buildRowData("Nama", laporanModel.user!.name ?? ''),
          buildRowData("Email", laporanModel.user!.email ?? ''),
          buildRowData("Telepon", laporanModel.user!.phone ?? ''),
          SizedBox(
            height: 8,
          ),
          laporanModel.status == 'selesai_survey' ||
                  laporanModel.status == 'diverifikasi_admin'
              ? PrimaryButton(
                  btnColor: const Color.fromRGBO(255, 255, 255, 1),
                  textColor: colorPrimary,
                  textButton: "Detail Survey",
                  borderSide: BorderSide(color: colorPrimary),
                  onPressed: () {
                    Get.to(() => DetailSurvey(
                          laporanDetailModel: laporanModel.detail!,
                        ));
                  },
                )
              : SizedBox.shrink(),
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

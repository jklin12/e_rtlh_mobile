import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/laporan_model.dart';

class LaporanListCard extends StatelessWidget {
  final LaporanModel laporan;
  final VoidCallback onTap;

  const LaporanListCard({
    super.key,
    required this.laporan,
    required this.onTap,
  });

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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      laporan.namaKepalaRumahTangga!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: getStatusColor(laporan.status!).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      laporan.status!.replaceAll("_", " ").toUpperCase(),
                      style: TextStyle(
                        color: getStatusColor(laporan.status!),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
    
              const SizedBox(height: 10),
    
              // CONTENT
              Text(
                "No. Rumah Tangga: ${laporan.nomorUrutRumahTangga}",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 6),
              Text(
                "${laporan.kabupaten} • ${laporan.kecamatan} • ${laporan.desa}",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 6),
              Text(
                laporan.alamat!,
                style: const TextStyle(fontSize: 13),
              ),
    
              const SizedBox(height: 12),
              Text(
                DateFormat("dd MMM yyyy").format(laporan.createdAt!),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

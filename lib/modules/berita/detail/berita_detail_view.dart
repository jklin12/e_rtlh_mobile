import 'package:flutter/material.dart';

import '../../../core/config/falvor_config.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/formater.dart';
import '../../../core/utils/styles.dart';
import '../../../data/model/berita_model.dart';

class BeritaDetailView extends StatelessWidget {
  const BeritaDetailView({super.key, required this.beritaModel});
  final BeritaModel beritaModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          "Detail Berita",
          style: titleStyle.copyWith(color: colorWhiteF3),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(),
                  const SizedBox(height: 8),
                  _metaInfo(),
                  const SizedBox(height: 16),
                  _description(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      beritaModel.title ?? '-',
      style: titleStyle
    );
  }

  Widget _imageHeader() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(
        "${FlavorConfig.baseUrl}/storage/${beritaModel.image}",
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey.shade200,
          child: const Icon(Icons.image, size: 60),
        ),
      ),
    );
  }

  Widget _metaInfo() {
    return Row(
      children: [
        const Icon(Icons.person_outline, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          beritaModel.creator!.name ?? 'Admin',
          style: contentSubTitleBigStyle,
        ),
        const SizedBox(width: 16),
        const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          convertToIndonesianShortFormatFromDateTime(beritaModel.createdAt),
          style: contentSubTitleBigStyle,
        ),
      ],
    );
  }

  Widget _description() {
    return Text(
      beritaModel.description ?? '-',
      style: contentStyle,
      textAlign: TextAlign.justify,
    );
  }
}

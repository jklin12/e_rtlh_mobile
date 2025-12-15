import 'package:e_rtlh_mobile/core/utils/formater.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/falvor_config.dart';
import '../../../../data/model/berita_model.dart';

class BeritaListCard extends StatelessWidget {
  final BeritaModel berita;
  final VoidCallback? onTap;

  const BeritaListCard({
    super.key,
    required this.berita,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageSection(),
              const SizedBox(width: 12),
              _contentSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: berita.image != null && berita.image!.isNotEmpty
          ? Image.network(
              "${FlavorConfig.baseUrl}/storage/${berita.image}",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return _imagePlaceholder();
              },
            )
          : _imagePlaceholder(),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: 90,
      height: 90,
      color: Colors.grey.shade300,
      child: const Icon(Icons.image, size: 32, color: Colors.grey),
    );
  }

  Widget _contentSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            berita.title ?? '-',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.person_outline, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                berita.creator!.name ?? 'Admin',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.calendar_today_outlined,
                  size: 13, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                convertToIndonesianShortFormatFromDateTime(berita.createdAt),
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            berita.description ?? '-',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

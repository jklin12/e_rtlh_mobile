import 'package:e_rtlh_mobile/core/utils/colors.dart';
import 'package:e_rtlh_mobile/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../config/falvor_config.dart';

class FotoPreviewPage extends StatelessWidget {
  final String imageUrl;
  final String keterangan;

  const FotoPreviewPage(
      {super.key, required this.imageUrl, required this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              minScale: 0.8,
              maxScale: 5.0,
              child: Image.network(
                "${FlavorConfig.baseUrl}/storage/$imageUrl",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                width: double.infinity,
                color: colorGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      keterangan,
                      style: labelTitleStyle.copyWith(color: colorWhiteF3),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

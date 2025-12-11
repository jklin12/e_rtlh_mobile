import 'package:flutter/material.dart';

import '../config/falvor_config.dart';

class FotoPreviewPage extends StatelessWidget {
  final String imageUrl;

  const FotoPreviewPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.8,
          maxScale: 5.0,
          child: Image.network(
            "${FlavorConfig.baseUrl}/storage/$imageUrl",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

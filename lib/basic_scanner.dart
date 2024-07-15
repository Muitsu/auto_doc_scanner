import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';

class BasicPage extends StatefulWidget {
  final void Function(Uint8List bytes) onPicture;
  const BasicPage({super.key, required this.onPicture});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  final _controller = DocumentScannerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DocumentScanner(
        controller: _controller,
        cropPhotoDocumentStyle: CropPhotoDocumentStyle(
          top: MediaQuery.of(context).padding.top,
        ),
        onSave: (Uint8List bytes) {
          // ? Bytes of the document/image already processed
          Navigator.pop(context);
          widget.onPicture(bytes);
        },
      ),
    );
  }
}

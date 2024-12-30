import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String barcode = '';

  Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        barcode = result.rawContent;
      });
    } catch (e) {
      setState(() {
        barcode = 'Failed to get barcode.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan result: $barcode',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanBarcode,
              child: const Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}

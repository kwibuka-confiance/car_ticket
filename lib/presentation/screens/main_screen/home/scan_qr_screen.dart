import 'package:car_ticket/presentation/screens/main_screen/home/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scan QR Code'),
      ),
      body: GetBuilder(
          init: QRcodeController(),
          builder: (QRcodeController qrController) {
            return Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const Center(
                    child: Text('Scan QR Code to get started'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: QRView(
                        key: qrController.qrKey,
                        onQRViewCreated: qrController.onQRViewCreated),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

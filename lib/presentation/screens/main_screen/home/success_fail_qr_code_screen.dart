import 'package:car_ticket/controller/navigation.dart';
import 'package:car_ticket/presentation/screens/main_screen/home/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeResultScreen extends StatelessWidget {
  final bool isSuccessful;
  const QrCodeResultScreen({required this.isSuccessful, super.key});

  @override
  Widget build(BuildContext context) {
    QRcodeController qrController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Code Result'),
      ),
      body: GetBuilder(builder: (NavigationController navController) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSuccessful ? Icons.check_circle : Icons.cancel,
                color: isSuccessful ? Colors.green : Colors.red,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isSuccessful ? 'Success' : 'Failed',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  navController.changeIndex(0);
                  qrController.controller!.stopCamera();
                },
                child: const Text('Back to home'),
              )
            ],
          ),
        );
      }),
    );
  }
}

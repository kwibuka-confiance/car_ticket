import 'package:car_ticket/controller/navigation.dart';
import 'package:car_ticket/domain/models/ticket/ticket.dart';
import 'package:car_ticket/domain/usecases/helpers/seats_length.dart';
import 'package:car_ticket/presentation/screens/main_screen/home/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QrCodeResultScreen extends StatelessWidget {
  final bool isSuccessful;
  final List<ExcelTicket> ticketsList;
  const QrCodeResultScreen(
      {required this.isSuccessful, required this.ticketsList, super.key});

  @override
  Widget build(BuildContext context) {
    QRcodeController qrController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Code Result'),
      ),
      body: GetBuilder(builder: (NavigationController navController) {
        List<String> tickets = seatsLength(ticketsList[2].seatNumbers);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSuccessful ? Icons.check_circle : Icons.cancel,
                color: isSuccessful ? Colors.green : Colors.red,
                size: 100,
              ),
              Text(
                isSuccessful ? 'Success' : 'Failed',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  isSuccessful
                      ? 'Your ticket(s) have been successfully verified you can now proceed to the car park.'
                      : 'Your ticket(s) have been expired or used',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: tickets
                    .map((e) => Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: SvgPicture.asset(
                                "assets/images/seat 2.svg",
                              ),
                            ),
                            Container(
                              // margin: const EdgeInsets.all(5),
                              child: Text(
                                "Seat $e",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 60,
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

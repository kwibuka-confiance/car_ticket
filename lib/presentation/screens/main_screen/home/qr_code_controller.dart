import 'package:car_ticket/domain/models/ticket/ticket.dart';
import 'package:car_ticket/domain/repositories/payment_repository/payment_repository_imp.dart';
import 'package:car_ticket/presentation/screens/main_screen/home/success_fail_qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRcodeController extends GetxController {
  final PaymentRepositoryImpl paymentRepository =
      Get.put(PaymentRepositoryImpl());
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isVerifying = false;

  List<ExcelTicket> ticketsList = [];

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      print(result!.code);
      verifyingQrCode(result);
      update();
    });
  }

  verifyingQrCode(Barcode? result) async {
    try {
      if (result!.code != null) {
        isVerifying = true;
        update();
        await getTickets();
        ExcelTicket ticket = checkIfTicketExist(result.code!);
        if (ticket.carId == result.code && !ticket.isExpired) {
          final updateTicket = ticket.copyWith(isExpired: true, isUsed: true);
          await paymentRepository.updateTicket(updateTicket);
          Get.to(() => const QrCodeResultScreen(isSuccessful: true));
        } else {
          Get.to(() => const QrCodeResultScreen(isSuccessful: false));
        }
      }
      isVerifying = false;
      update();
    } catch (e) {
      isVerifying = false;
      update();
      rethrow;
    }
  }

  ExcelTicket checkIfTicketExist(String qrcodeResult) {
    final ticket = ticketsList.firstWhere(
        (element) => element.carId == qrcodeResult,
        orElse: () => ExcelTicket.empty);
    return ticket;
  }

  getTickets() async {
    print('Getting tickets');
    try {
      isVerifying = true;
      update();
      List<ExcelTicket> tickets = [];
      tickets = await paymentRepository.getTickets();
      ticketsList = tickets;
      print('Tickets: $ticketsList');
      isVerifying = false;
      update();
    } catch (e) {
      isVerifying = false;
      update();
      rethrow;
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}

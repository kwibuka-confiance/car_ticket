import 'package:car_ticket/domain/models/payment/customer_payment.dart';
import 'package:car_ticket/domain/models/seat.dart';
import 'package:car_ticket/domain/models/ticket/ticket.dart';

abstract class PaymentRepository {
  createPaymentIntent(String amount, String currency);
  Future<void> stripeMakePayment(
      String amount,
      String currency,
      String carId,
      List<Seat> carSeats,
      String destinationId,
      String carDestinationFromTime,
      String carDestinationToTime);
  Future<void> displayPaymentSheet(
      String carId,
      List<Seat> carSeats,
      String clientSecret,
      String destinationId,
      String carDestinationFromTime,
      String carDestinationToTime);
  String calculateAmount(String price);
  Future<void> saveCustomerPaymentsInDb(UserPayment userPayment);
  Future<void> createTicket(
      String carId,
      List<Seat> carSeats,
      String destinationId,
      String carDestinationFromTime,
      String carDestinationToTime);
  Future<List<ExcelTicket>> getTickets();
  Future<void> updateTicket(ExcelTicket ticket);

  Future<List<UserPayment>> getCustomerPayments(String userId);
  Future<List<UserPayment>> getAllPayments();
}

import 'package:car_ticket/domain/models/car/car.dart';
import 'package:car_ticket/presentation/widgets/dashboard/assignings/assign_driver_to_car.dart';
import 'package:car_ticket/presentation/widgets/dashboard/car_qrcode_creation.dart';
import 'package:flutter/material.dart';

class CarListItem extends StatelessWidget {
  final ExcelCar car;

  const CarListItem({required this.car, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.car_rental),
              title: Text(car.name),
              subtitle: Text(car.plateNumber),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CarQrCodeCreation(
                              car: car,
                            );
                          });
                    },
                    child: const Text('Create Qr Code'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return AssignDriverToCar(
                              car: car,
                            );
                          });
                    },
                    child: car.driverId.isEmpty
                        ? const Text("Assign Driver")
                        : const Text('Change Driver'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

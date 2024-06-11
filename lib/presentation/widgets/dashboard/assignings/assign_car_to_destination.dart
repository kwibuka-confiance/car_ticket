import 'package:car_ticket/controller/dashboard/car_controller.dart';
import 'package:car_ticket/controller/dashboard/journey_destination_controller.dart';
import 'package:car_ticket/domain/models/destination/journey_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCarToDestination extends StatelessWidget {
  final JourneyDestination destination;
  const AddCarToDestination({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    JourneyDestinationController destinationController =
        Get.find<JourneyDestinationController>();
    return GetBuilder(
        init: CarController(),
        builder: (CarController carController) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Add Car to Destination",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                carController.isGettingCars ||
                        destinationController.isAssigningCar
                    ? const SizedBox(
                        height: 130,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: carController.cars.length,
                        itemBuilder: (context, item) {
                          if (carController.cars.isEmpty) {
                            return const Center(
                              child: Text("No Cars"),
                            );
                          }
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.drive_eta),
                                        Text(
                                            " ${carController.cars[item].name}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 15,
                                        ),
                                        Text(
                                            " ${carController.cars[item].color}"),
                                      ],
                                    ),
                                    Text(
                                        "Plate Number: ${carController.cars[item].plateNumber}",
                                        style: const TextStyle(fontSize: 10)),
                                  ],
                                ),
                                destinationController.isAssigningCar
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        onPressed: destination.carId ==
                                                carController.cars[item].id
                                            ? () => destinationController
                                                .unAssignCarToDestination(
                                                    destinationId:
                                                        destination.id)
                                            : () {
                                                destinationController
                                                    .assignCarToDestination(
                                                        destinationId:
                                                            destination.id,
                                                        carId: carController
                                                            .cars[item].id);
                                              },
                                        child: destination.carId ==
                                                carController.cars[item].id
                                            ? const Text('Unassign')
                                            : const Text('Assign'),
                                      ),
                              ],
                            ),
                          );
                        }),
              ],
            ),
          );
        });
  }
}

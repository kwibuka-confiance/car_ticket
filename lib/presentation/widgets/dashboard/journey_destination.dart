import 'package:car_ticket/controller/dashboard/journey_destination_controller.dart';
import 'package:car_ticket/domain/models/destination/journey_destination.dart';
import 'package:car_ticket/presentation/screens/main_screen/dashboard/destination/edit_destination.dart';
import 'package:car_ticket/presentation/widgets/dashboard/assignings/assign_car_to_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DestinationCard extends StatelessWidget {
  final JourneyDestination destination;
  const DestinationCard({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text(destination.description),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${destination.price} Rwf"),
            Text("${destination.from} to ${destination.to}"),
            Text(destination.duration),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AddCarToDestination(destination: destination);
                        });
                  },
                  child: Text(
                    'Add Car to Destination',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        trailing: DestinationOptionWidget(destination: destination),
      ),
    );
  }
}

class DestinationOptionWidget extends StatelessWidget {
  final JourneyDestination destination;
  const DestinationOptionWidget({required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (JourneyDestinationController destinationController) {
      return destination.id == destinationController.deleteDestinationId &&
              destinationController.isDestinationDeleting
          ? const CircularProgressIndicator()
          : PopupMenuButton<JourneyDestinationStatus>(
              initialValue: destinationController.selectedItem,
              onSelected: destinationController.changeDestinationStatus,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<JourneyDestinationStatus>>[
                PopupMenuItem<JourneyDestinationStatus>(
                  value: JourneyDestinationStatus.edit,
                  onTap: () {
                    destinationController.initializeItemsForEdit(destination);
                    bottomSheetEditCar(context, destination);
                  },
                  child: const Text('Edit'),
                ),
                PopupMenuItem<JourneyDestinationStatus>(
                  value: JourneyDestinationStatus.delete,
                  onTap: () =>
                      destinationController.deleteDestination(destination),
                  child: const Text('Delete'),
                ),
              ],
            );
    });
  }

  bottomSheetEditCar(BuildContext context, JourneyDestination destination) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: EditDestinationWidget(destination: destination),
      ),
    );
  }
}

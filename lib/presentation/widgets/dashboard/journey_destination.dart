import 'package:car_ticket/domain/models/destination/journey_destination.dart';
import 'package:car_ticket/presentation/widgets/dashboard/assignings/assign_car_to_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: const Text('Add Car to Destination'),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        trailing: Text(destination.duration),
      ),
    );
  }
}

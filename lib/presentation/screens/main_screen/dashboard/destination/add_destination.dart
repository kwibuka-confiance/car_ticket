import 'package:car_ticket/controller/dashboard/journey_destination_controller.dart';
import 'package:car_ticket/domain/models/destination/journey_destination.dart';
import 'package:car_ticket/presentation/widgets/custom_textfields_decoration.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddDestination extends StatelessWidget {
  const AddDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: JourneyDestinationController(),
        builder: (JourneyDestinationController destinationController) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Add Destination",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade400,
                              width: 1.5,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton<String>(
                        value: destinationController.selectedDestination,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        hint: const Text("Select Destination"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 71, 71, 71)),
                        underline: Container(
                          height: 0,
                          color: const Color.fromARGB(255, 68, 68, 68),
                        ),
                        onChanged:
                            destinationController.selectedDestinationChange,
                        items: destinationNames.map<DropdownMenuItem<String>>(
                            (DestinationName value) {
                          return DropdownMenuItem<String>(
                            value: value.name.toString(),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    value.name.substring(0, 1),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  value.name,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimePickerWidget(
                          chooseTime: destinationController.initialTime,
                          title: "From",
                          onTimeChanged: (value) {
                            destinationController.initialTime = value;
                            destinationController.update();
                          },
                        ),
                        TimePickerWidget(
                          chooseTime: destinationController.finalTime,
                          title: "To",
                          onTimeChanged: (value) {
                            destinationController.finalTime = value;
                            destinationController.update();
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                        controller: destinationController.priceController,
                        keyboardType: TextInputType.number,
                        decoration: customTextFieldDecoration(
                            labelText: "Price",
                            hintText: "Price",
                            context: context)),
                    const Gap(15),
                    TextFormField(
                        controller: destinationController.durationController,
                        decoration: customTextFieldDecoration(
                            labelText: "Duration",
                            hintText: "Duration",
                            context: context)),
                    const Gap(15),
                    // TextFormField(
                    //     controller: destinationController.startDateController,
                    //     decoration: customTextFieldDecoration(
                    //         labelText: "Start Date",
                    //         hintText: "Start Date",
                    //         context: context)),
                    // const Gap(15),
                    // TextFormField(
                    //     controller:
                    //         destinationController.availableSeatsController,
                    //     decoration: customTextFieldDecoration(
                    //         labelText: "Available Seats",
                    //         hintText: "Available Seats",
                    //         context: context)),
                    const Gap(15),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 10),
                      child: MainButton(
                          isColored: true,
                          isLoading:
                              destinationController.isDestinationCreating,
                          isDisabled:
                              destinationController.isDestinationCreating,
                          onPressed: () {
                            final uuid = const Uuid().v1();
                            const picture =
                                "https://www.kigalitoday.com/IMG/png/imodoka.png";
                            final newDestination = JourneyDestination(
                              id: uuid,
                              description:
                                  destinationController.selectedDestination!,
                              from: destinationController.initialTime,
                              to: destinationController.finalTime,
                              price: destinationController.priceController.text,
                              duration:
                                  destinationController.durationController.text,
                              imageUrl: picture,
                              createdAt: DateTime.now().toString(),
                              updatedAt: DateTime.now().toString(),
                              carId: "",
                              isAssigned: false,
                            );

                            destinationController
                                .createDestination(newDestination);
                          },
                          title: "Add Destination"),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class DestinationName {
  final int id;
  final String name;

  DestinationName({required this.id, required this.name});
}

List<DestinationName> destinationNames = [
  DestinationName(id: 1, name: "Kigali - Nyamata"),
  DestinationName(id: 1, name: "Nyamata - Kigali")
];

class TimePickerWidget extends StatefulWidget {
  String chooseTime;
  String title;
  Function(String) onTimeChanged;
  TimePickerWidget({
    required this.chooseTime,
    required this.title,
    required this.onTimeChanged,
    super.key,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.chooseTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const Gap(5),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.5,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  if (value != null) {
                    widget.onTimeChanged(value.format(context));
                  }
                });
              },
              child: Container(
                width: 120,
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.chooseTime)
                  ],
                ),
              ),
            )),
        const Gap(15)
      ],
    );
  }
}

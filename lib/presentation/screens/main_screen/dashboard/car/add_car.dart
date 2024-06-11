import 'package:car_ticket/controller/dashboard/car_controller.dart';
import 'package:car_ticket/domain/models/car/car.dart';
import 'package:car_ticket/presentation/widgets/custom_textfields_decoration.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uuid/uuid.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CarController(),
        builder: (CarController carController) {
          return Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: carController.carformKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: carController.nameController,
                          decoration: customTextFieldDecoration(
                              labelText: "Name",
                              hintText: "Name",
                              context: context)),
                      const Gap(15),
                      TextFormField(
                          controller: carController.plateNumberController,
                          decoration: customTextFieldDecoration(
                              labelText: "Plate Number",
                              hintText: "Plate Number",
                              context: context)),
                      const Gap(15),
                      TextFormField(
                          controller: carController.colorController,
                          decoration: customTextFieldDecoration(
                              labelText: "Color",
                              hintText: "Color",
                              context: context)),
                      const Gap(15),
                      TextFormField(
                          controller: carController.modelController,
                          decoration: customTextFieldDecoration(
                              labelText: "Model",
                              hintText: "Model",
                              context: context)),
                      const Gap(15),
                      TextFormField(
                          controller: carController.yearController,
                          decoration: customTextFieldDecoration(
                              labelText: "Year",
                              hintText: "Year",
                              context: context)),
                      const Gap(15),
                      MainButton(
                        isColored: true,
                        title: "Add Car",
                        isDisabled: carController.isCarCreating,
                        isLoading: carController.isCarCreating,
                        onPressed: () async {
                          await carController.addCar(ExcelCar(
                            id: const Uuid().v4(),
                            name: carController.nameController.text,
                            plateNumber:
                                carController.plateNumberController.text,
                            color: carController.colorController.text,
                            model: carController.modelController.text,
                            year: carController.yearController.text,
                            driverId: "",
                            isAssigned: false,
                            seatNumbers: 28,
                          ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

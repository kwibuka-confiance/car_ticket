import 'package:car_ticket/controller/dashboard/driver_controller.dart';
import 'package:car_ticket/domain/models/driver/driver.dart';
import 'package:car_ticket/presentation/widgets/custom_textfields_decoration.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uuid/uuid.dart';

class AddDriver extends StatelessWidget {
  const AddDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DriverController(),
        builder: (DriverController driverController) {
          return Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Add Driver",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: driverController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: driverController.firstNameController,
                            decoration: customTextFieldDecoration(
                                labelText: "First Name",
                                hintText: "First Name",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController.lastNameController,
                            decoration: customTextFieldDecoration(
                                labelText: "Last Name",
                                hintText: "Last Name",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController.emailController,
                            decoration: customTextFieldDecoration(
                                labelText: "Email",
                                hintText: "Email",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController.phoneController,
                            decoration: customTextFieldDecoration(
                                labelText: "Phone",
                                hintText: "Phone",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController.addressController,
                            decoration: customTextFieldDecoration(
                                labelText: "Address",
                                hintText: "Address",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController.cityController,
                            decoration: customTextFieldDecoration(
                                labelText: "City",
                                hintText: "City",
                                context: context)),
                        const Gap(15),
                        TextFormField(
                            controller: driverController
                                .driverLicenseCategoryController,
                            decoration: customTextFieldDecoration(
                                labelText: "Driver License Category",
                                hintText: "Driver License Category",
                                context: context)),
                      ],
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: MainButton(
                    isColored: true,
                    isLoading: driverController.isDriverCreating,
                    isDisabled: driverController.isDriverCreating,
                    onPressed: () {
                      const uuid = Uuid();
                      CarDriver driver = CarDriver(
                          id: uuid.v1(),
                          firstName: driverController.firstNameController.text,
                          lastName: driverController.lastNameController.text,
                          email: driverController.emailController.text,
                          phone: driverController.phoneController.text,
                          address: driverController.addressController.text,
                          city: driverController.cityController.text,
                          driverLicenseCategory: driverController
                              .driverLicenseCategoryController.text,
                          isAssigned: false,
                          sexStatus: "Not Specified");

                      if (driverController.formKey.currentState!.validate()) {
                        // print("driver: $driver");

                        driverController.addDriver(driver);
                      }
                    },
                    title: "Add Driver"),
              )
            ],
          );
        });
  }
}

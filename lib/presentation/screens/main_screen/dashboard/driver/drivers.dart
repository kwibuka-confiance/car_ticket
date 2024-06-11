import 'package:car_ticket/controller/dashboard/driver_controller.dart';
import 'package:car_ticket/presentation/screens/main_screen/dashboard/driver/add_driver.dart';
import 'package:car_ticket/presentation/widgets/dashboard/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DriversScreen extends StatelessWidget {
  static const String routeName = '/drivers';
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            title: const Text('Drivers'),
            floating: true,
            snap: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 200,
            foregroundColor: Colors.white,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton.icon(
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const AddDriver(),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text('Add Driver',
                              style: TextStyle(color: Colors.white)),
                        ))))),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: const Row(
                  children: [
                    Text('All Drivers',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              GetBuilder(
                  init: DriverController(),
                  builder: (DriverController driverController) {
                    return driverController.isGettingDrivers
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: driverController.drivers.length,
                                itemBuilder: (context, index) {
                                  final driver =
                                      driverController.drivers[index];
                                  return UserItem(
                                    firstName: driver.firstName,
                                    lastName: driver.lastName,
                                    email: driver.email,
                                    phone: driver.phone,
                                  );
                                }),
                          );
                  }),
            ],
          ),
        ),
      ],
    ));
  }
}

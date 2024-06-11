import 'package:car_ticket/controller/home/destinations.dart';
import 'package:car_ticket/presentation/screens/main_screen/dashboard/destination/add_destination.dart';
import 'package:car_ticket/presentation/screens/main_screen/home/car_availability_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeJourneyDestinationController(),
        builder: (HomeJourneyDestinationController homeController) {
          return SizedBox(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      children: [
                        SafeArea(
                          child: Container(
                            padding: const EdgeInsets.only(top: 50),
                            child: const Text('Excel tours',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 140,
                    right: 20,
                    child: TextButton.icon(
                        onPressed: () {
                          SearchAlert.show(context);
                        },
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        label: const Text("Filter",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))),
                Positioned(
                    top: 140,
                    left: 20,
                    child: !homeController.isAllDestinationsShown
                        ? TextButton.icon(
                            onPressed: () async {
                              homeController.showAllDestinations();
                            },
                            icon: const Icon(
                              Icons.clear_all_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            label: const Text("Show all",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)))
                        : const SizedBox()),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 20),
                              child: const Text('Select your destination',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            // switch
                            homeController.isGettingDestinations
                                ? const SizedBox(
                                    height: 400,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : homeController.destinations.isEmpty
                                    ? const SizedBox(
                                        height: 400,
                                        child: Center(
                                          child:
                                              Text("No destinations available"),
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        itemCount:
                                            homeController.destinations.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            CarAvailability(
                                              destination: homeController
                                                  .destinations
                                                  .elementAt(index),
                                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class SearchAlert {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return GetBuilder(
            builder: (HomeJourneyDestinationController homeDestController) {
          return AlertDialog(
            title: const Text("Filter"),
            content: Wrap(
              children: [
                Column(
                  children: [
                    const Text(
                        "Choose a date you want to travel and also select the your destination to get the available cars."),
                    const Gap(20),
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
                        value: homeDestController.selectedDestinationOption,
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
                        onChanged: homeDestController.selectedDestinationChange,
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
                        value: homeDestController.selectedTimeOption,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        hint: const Text("Select Time"),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 71, 71, 71)),
                        underline: Container(
                          height: 0,
                          color: const Color.fromARGB(255, 68, 68, 68),
                        ),
                        onChanged: homeDestController.selectedTimeChange,
                        items: timeOfAvailableHours
                            .map<DropdownMenuItem<String>>(
                                (TimeOfAvailableHour value) {
                          return DropdownMenuItem<String>(
                            value: value.hourValue.toString(),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    value.hourValue.substring(0, 1),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  value.hourValue,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Gap(10),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  homeDestController.searchDestinations(
                      homeDestController.selectedTimeOption!,
                      homeDestController.selectedDestinationOption!);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
      },
    );
  }
}

class TimeOfAvailableHour {
  final String hour;
  final String hourValue;

  TimeOfAvailableHour(this.hour, this.hourValue);
}

List<TimeOfAvailableHour> timeOfAvailableHours = [
  TimeOfAvailableHour("0", "12:00 AM"),
  TimeOfAvailableHour("1", "12:30 AM"),
  TimeOfAvailableHour("2", "1:00 AM"),
  TimeOfAvailableHour("3", "1:30 AM"),
  TimeOfAvailableHour("4", "2:00 AM"),
  TimeOfAvailableHour("5", "2:30 AM"),
  TimeOfAvailableHour("6", "3:00 AM"),
  TimeOfAvailableHour("7", "3:30 AM"),
  TimeOfAvailableHour("8", "4:00 AM"),
  TimeOfAvailableHour("9", "4:30 AM"),
  TimeOfAvailableHour("10", "5:00 AM"),
  TimeOfAvailableHour("11", "5:30 AM"),
  TimeOfAvailableHour("12", "6:00 AM"),
  TimeOfAvailableHour("13", "6:30 AM"),
  TimeOfAvailableHour("14", "7:00 AM"),
  TimeOfAvailableHour("15", "7:30 AM"),
  TimeOfAvailableHour("16", "8:00 AM"),
  TimeOfAvailableHour("17", "8:30 AM"),
  TimeOfAvailableHour("18", "9:00 AM"),
  TimeOfAvailableHour("19", "9:30 AM"),
  TimeOfAvailableHour("20", "10:00 AM"),
  TimeOfAvailableHour("21", "10:30 AM"),
  TimeOfAvailableHour("22", "11:00 AM"),
  TimeOfAvailableHour("23", "11:30 AM"),
  TimeOfAvailableHour("24", "12:00 PM"),
  TimeOfAvailableHour("25", "12:30 PM"),
  TimeOfAvailableHour("26", "1:00 PM"),
  TimeOfAvailableHour("27", "1:30 PM"),
  TimeOfAvailableHour("28", "2:00 PM"),
  TimeOfAvailableHour("29", "2:30 PM"),
  TimeOfAvailableHour("30", "3:00 PM"),
  TimeOfAvailableHour("31", "3:30 PM"),
  TimeOfAvailableHour("32", "4:00 PM"),
  TimeOfAvailableHour("33", "4:30 PM"),
  TimeOfAvailableHour("34", "5:00 PM"),
  TimeOfAvailableHour("35", "5:30 PM"),
  TimeOfAvailableHour("36", "6:00 PM"),
  TimeOfAvailableHour("37", "6:30 PM"),
  TimeOfAvailableHour("38", "7:00 PM"),
  TimeOfAvailableHour("39", "7:30 PM"),
  TimeOfAvailableHour("40", "8:00 PM"),
  TimeOfAvailableHour("41", "8:30 PM"),
  TimeOfAvailableHour("42", "9:00 PM"),
  TimeOfAvailableHour("43", "9:30 PM"),
  TimeOfAvailableHour("44", "10:00 PM"),
  TimeOfAvailableHour("45", "10:30 PM"),
  TimeOfAvailableHour("46", "11:00 PM"),
  TimeOfAvailableHour("47", "11:30 PM"),
];

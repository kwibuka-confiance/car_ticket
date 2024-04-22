import 'package:car_ticket/domain/models/seat.dart';
import 'package:car_ticket/presentation/screens/car_all_details/seat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarAvailableDetails extends StatelessWidget {
  static const String routeName = '/car_details';
  const CarAvailableDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Container(
                    child: const Text('Kigali # Nyamata',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.72,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40, bottom: 20),
                          child: Text('Select your destination',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SeatSelection(
                              isTitle: true,
                              title: "Available",
                              isReserved: false,
                            ),
                            SeatSelection(
                              isTitle: true,
                              title: "Reserved",
                              isReserved: true,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              margin: const EdgeInsets.only(top: 20),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 2.1),
                                  itemCount: leftSeats.length,
                                  itemBuilder: (context, index) =>
                                      SeatSelection(
                                          isReserved:
                                              leftSeats[index].isReserved)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              margin: const EdgeInsets.only(top: 20),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 2,
                                          childAspectRatio: 2.1),
                                  itemCount: rightSeats.length,
                                  itemBuilder: (context, index) =>
                                      SeatSelection(
                                          isReserved:
                                              leftSeats[index].isReserved)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 70,
              left: 40,
              right: 40,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Text("Excel Tours", style: TextStyle(fontSize: 18.0.sp)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2023.10.05"),
                          Text("09AM, Mon"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Type:N0 RAD 385 X"),
                          Text("Price: RWF 5000"),
                        ],
                      ),
                    )
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}

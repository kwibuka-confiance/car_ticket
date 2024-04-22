import 'package:car_ticket/presentation/screens/main_screen/home/car_availability_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
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
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: const Text('Kigali # Nyamata',
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
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        child: const Text('Select your destination',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      // switch
                      ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CarAvailability(
                                index: index,
                              ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

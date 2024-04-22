import 'package:car_ticket/presentation/screens/main_screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class Navigations extends StatelessWidget {
  static const String routeName = '/navigations';
  const Navigations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HomeScreen()),
    );
  }
}

import 'package:flutter/material.dart';

class SeatSelection extends StatelessWidget {
  final String? seatNumber;
  final bool isReserved;
  final String? title;
  final bool isTitle;

  const SeatSelection(
      {this.isTitle = false,
      this.seatNumber,
      required this.isReserved,
      this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isReserved ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                spreadRadius: 1,
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        isTitle ? Text(title!) : Container(),
      ],
    );
  }
}

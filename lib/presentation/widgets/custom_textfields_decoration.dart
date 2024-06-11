import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration customTextFieldDecoration(
    {required String labelText,
    required String hintText,
    required BuildContext context}) {
  return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1.0,
          )));
}

InputDecoration customTextFieldDecorationWhite(
    {required String labelText,
    required String hintText,
    required BuildContext context}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(3.0),
      labelText: labelText,
      hintText: hintText,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          )));
}

InputDecoration customTextFieldDecorationUnLabeled(
    {required String labelText,
    required String hintText,
    required BuildContext context}) {
  return InputDecoration(
      // labelText: labelText,
      contentPadding: const EdgeInsets.all(3.0),
      labelStyle: TextStyle(
        color: Colors.grey.withOpacity(0.3),
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.normal,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.3),
        fontFamily: GoogleFonts.roboto().fontFamily,
        fontWeight: FontWeight.normal,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.0,
          )));
}

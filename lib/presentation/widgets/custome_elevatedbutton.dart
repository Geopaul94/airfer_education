

import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

Widget customMaterialButton(String title, {Color? color, double? height, double? width}) {
  return Container(

    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? buttoncolor, // Default color (blue)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // Border radius
        ),
      ),
      onPressed: () {
        // Add your onPressed functionality here
      },
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

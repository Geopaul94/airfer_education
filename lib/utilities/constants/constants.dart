import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: constant_identifier_names


const Color white = Colors.white;
const Color red = Colors.red;
const Color  arrowcolor =const Color.fromARGB(255, 142, 131, 131);const Color purple = Colors.purple;
const buttoncolor = Color.fromARGB(255, 166, 31, 21);
const darkgreymain = Color.fromARGB(255, 21, 21, 22);

const Color black =Colors.black;



const grey = Colors.grey;




// Remove 'const' for non-constant expressions
double defaultPadding = 16.0.w; // Scaled padding using .w

Duration defaultDuration = Duration(microseconds: 300);

Gradient gradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 232, 218, 218),
    Color.fromARGB(255, 232, 218, 218),
  ],
);

TextStyle colorizeTextStyle = TextStyle(
  fontSize: 14.0.sp, // Scaled font size using .sp
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);

TextStyle profilestyle = TextStyle(
  fontWeight: FontWeight.bold, 
  fontSize: 18.sp, // Scaled font size
);

TextStyle profilestyle2 = TextStyle(
  fontWeight: FontWeight.w500, 
  fontSize: 15.sp, // Scaled font size
);

SizedBox h5 = SizedBox(height: 5.0.h); // Scaled height using .h
SizedBox h10 = SizedBox(height: 10.0.h); // Scaled height
SizedBox h20 = SizedBox(height: 20.0.h); // Scaled height
SizedBox h30 = SizedBox(height: 30.0.h); // Scaled height
SizedBox h40 = SizedBox(height: 40.0.h); // Scaled height
SizedBox h16 = SizedBox(height: 16.0.h); // Scaled height
SizedBox h15 = SizedBox(height: 15.0.h); // Scaled height
SizedBox h50 = SizedBox(height: 50.0.h); // Scaled height
SizedBox h80 = SizedBox(height: 80.0.h); // Scaled height
SizedBox h100 = SizedBox(height: 100.0.h); // Scaled height

// SizedBox for widths
SizedBox w10 = SizedBox(width: 10.0.w); // Scaled width using .w
SizedBox w20 = SizedBox(width: 20.0.w); // Scaled width
SizedBox w30 = SizedBox(width: 30.0.w); // Scaled width
SizedBox w40 = SizedBox(width: 40.0.w); // Scaled width
SizedBox kwidth = SizedBox(width: 10.0.w); // Scaled width

// Border radius
BorderRadius kradius10 = BorderRadius.circular(10.0.w); // Scaled border radius
BorderRadius kradius30 = BorderRadius.circular(30.0.w); // Scaled border radius
BorderRadius kradius20 = BorderRadius.circular(20.0.w); // Scaled border radius
BorderRadius kradius100 = BorderRadius.circular(100.0.w); // Scaled border radius

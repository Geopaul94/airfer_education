
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customeProfileCircle(String imageUrl) {
  return Container(
    width: 45.w, // Adjust the size as per your requirement
    height: 45.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white, // White border color
        width: .5,         // Border width
      ),
      image: DecorationImage(
        image: AssetImage(imageUrl), // Pass the imageUrl here
        fit: BoxFit.cover,
      ),
    ),
  );
}
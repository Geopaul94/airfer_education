
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customeProfileCircle(String imageUrl) {
  return Container(
    width: 50.w, 
    height: 50.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.white, 
        width: 1,       
      ),
      image: DecorationImage(
        image: AssetImage(imageUrl), 
        fit: BoxFit.cover,
      ),
    ),
  );
}
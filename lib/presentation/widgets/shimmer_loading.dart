import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({super.key});

  @override
  _ShimmerLoadingState createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Color _baseColor = const Color.fromARGB(255, 112, 110, 110);
  Color _highlightColor = const Color.fromARGB(255, 213, 207, 207);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  void _startColorAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _baseColor = _baseColor == const Color.fromARGB(255, 107, 105, 105)
            ? const Color.fromARGB(255, 168, 165, 165)
            : const Color.fromARGB(255, 86, 83, 83);
        _highlightColor = _highlightColor == const Color.fromARGB(255, 213, 207, 207)
            ? const Color.fromARGB(255, 240, 235, 235)
            : const Color.fromARGB(255, 213, 207, 207);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                height: 250.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                height: 230.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

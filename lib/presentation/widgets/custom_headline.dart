
  import 'package:airfer_education/presentation/bloc/headline/headline_color_bloc.dart';
import 'package:airfer_education/presentation/bloc/headline/headline_color_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customHeadlineContainer(String title, int index, BuildContext context) {
    final bloc = BlocProvider.of<ContainerBloc>(context);
    final backgroundColor = bloc.getBackgroundColor(index);
    final textColor = bloc.getTextColor(index);

    return GestureDetector(
      onTap: () {
        bloc.add(SelectContainerEvent(index));
      },
      child: Container(
        height: 40.h, // Using screen_util extension
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        alignment: Alignment.center, // Center align the child for better appearance
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,fontSize: 14.sp
,fontWeight: FontWeight.w600            ), // Adjust the text color based on selection
          ),
        ),
      ),
    );
  }

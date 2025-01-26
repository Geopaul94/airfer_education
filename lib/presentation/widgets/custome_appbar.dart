import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:airfer_education/presentation/widgets/custome_elevatedbutton.dart';
import 'package:airfer_education/presentation/widgets/custome_profile_circle.dart';
import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({super.key}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.black,
      elevation: 1,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              customeProfileCircle('assets/10.jpg'),
              w20,
              customMaterialButton('Follow ',
                  color: buttoncolor, ),
            ],
          ),
        ),
      ],
    );
  }
}

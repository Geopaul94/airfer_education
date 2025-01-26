
import 'package:airfer_education/data/model/photo_model.dart';
import 'package:airfer_education/presentation/screens/custom_text.dart';
import 'package:airfer_education/presentation/widgets/price_container.dart';
import 'package:airfer_education/utilities/functions/dress_caption.dart';
import 'package:airfer_education/utilities/functions/dress_code.dart';
import 'package:airfer_education/utilities/functions/random_price.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/constants/constants.dart';

class imageContainer extends StatelessWidget {
   imageContainer({
    super.key,
    required this.image,
  });

  final ImageModel image;
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      height: index % 2 == 0 ? 300 : 380,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 5.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20),
                  child: Image.network(
                    image.imageUrl,
                    height:
                        index % 2 == 0 ? 230 : 280,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: priceContainer(
                    getRandomPrice(),
                    color: const Color.fromARGB(
                        200, 158, 158, 158),
                    height: 35.h,
                    width: 40.w,
                  ),
                ),
              ],
            ),
            h10,
            Row(
              children: [
                CustomText(
                  text: getRandomDressCaption(),
                  color: const Color.fromARGB(
                      182, 0, 0, 0),
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            CustomText(
              text: getRandomDressCode(),
              color:
                  const Color.fromARGB(182, 0, 0, 0),
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}

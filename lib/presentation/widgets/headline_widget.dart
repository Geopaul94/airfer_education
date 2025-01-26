import 'package:airfer_education/presentation/widgets/custom_headline.dart';
import 'package:flutter/material.dart';

class headlineRow extends StatelessWidget {
  const headlineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customHeadlineContainer('Activity', 0, context),
        customHeadlineContainer('Community', 1, context),
        customHeadlineContainer('Shop', 2, context),
      ],
    );
  }
}

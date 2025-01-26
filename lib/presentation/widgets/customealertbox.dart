


import 'package:airfer_education/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class customealertbox extends StatelessWidget {
  const customealertbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        'Download Image',
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        'Do you want to download the image?',
        style: TextStyle(color: grey),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(
                    Colors.orange),
            shape: WidgetStateProperty.all<
                RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Cancel
          },
          child: Text(
            'Cancel',
            style:
                TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(
                    Colors.green),
            shape: WidgetStateProperty.all<
                RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .pop(true); // Download
          },
          child: Text(
            'Download',
            style:
                TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

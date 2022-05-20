import 'package:flutter/material.dart';

import '../../colors.dart';

// inactive button with circular progress indicator
Widget buildLoadingButton(BuildContext context) {
  return SizedBox(
    height: 55,
    child: MaterialButton(
      color: rwColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            'Loading...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

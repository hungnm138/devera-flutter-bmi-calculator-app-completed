import 'package:flutter/material.dart';
import '../constants/app_styles.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: kBottomContainerColour,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(bottom: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

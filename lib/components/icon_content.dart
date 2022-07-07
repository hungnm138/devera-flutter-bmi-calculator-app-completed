import 'package:flutter/material.dart';
import '../constants/app_styles.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {Key? key, required this.icon, this.label = "", required this.color})
      : super(key: key);

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

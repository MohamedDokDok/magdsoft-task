import 'package:flutter/material.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.onPress,
      required this.height,
      required this.width,
      required this.buttonColor,
      required this.label,
      required this.labelSize,
      required this.labelColor})
      : super(key: key);

  final Function() onPress;
  final double height;
  final double width;
  final Color buttonColor;
  final String label;
  final double labelSize;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      color: buttonColor,
      child: Text(
        label,
        style: TextStyle(
          fontSize: labelSize,
          color: labelColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<Color?>? foregroundColor;
  const CustomButton({super.key, this.text, this.onPressed, this.textStyle, this.backgroundColor, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        // foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF222222)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),

        // Flutter doesn't support transitions for state changes; you'd use animations for that.
      ),
      onPressed: onPressed,
      child: Text(text!, style: textStyle),
    );
  }
}

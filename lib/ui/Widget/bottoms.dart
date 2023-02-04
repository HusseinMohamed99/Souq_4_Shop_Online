import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
 final Color? color;
  final Color? textColor;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;

  const DefaultButton(
      {required this.text,
      required this.function,
      this.color,
      this.textColor,
      this.isUpperCase = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: color ?? Colors.white,
      ),
      onPressed: function,
      child: Text(
        textAlign: TextAlign.center,
        isUpperCase ? text.toUpperCase() : text,
        style: GoogleFonts.roboto(
          fontSize: 20,
          color: textColor ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

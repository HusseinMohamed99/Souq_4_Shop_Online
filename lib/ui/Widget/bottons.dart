import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
 final Color? color;
 final Color? textColor;
 final Function() function;
 final String text;
 final bool isUpperCase;
  const DefaultButton(
      {required this.text,
      required this.function,
      this.color,
        this.textColor,
        required this.isUpperCase,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: color ?? Colors.white,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: function,
      child: FittedBox(
        child: Text(
          textAlign: TextAlign.center,
          isUpperCase ? text.toUpperCase() : text,
          style: GoogleFonts.roboto(
            fontSize: 19,
            color: textColor??  Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

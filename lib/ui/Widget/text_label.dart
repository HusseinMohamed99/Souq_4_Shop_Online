import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTextLabel extends StatelessWidget {
  final String textLabel;
  const DefaultTextLabel({required this.textLabel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textLabel,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).secondaryHeaderColor,
        fontSize: 18,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      required this.keyboardType,
      required this.validate,
      required this.hint,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.suffix,
      this.suffixPressed,
      this.prefix,
      Key? key})
      : super(key: key);
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final String? hint;
  final dynamic onTap;
  final dynamic onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isPassword;
  final bool? isClickable;
  final InputDecoration? decoration;
  final IconData? suffix;
  final IconData? prefix;
  final Function? suffixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        minLines: 1,
        obscuringCharacter: obscuringCharacter ?? '*',
        controller: controller,
        validator: validate,
        enabled: isClickable ?? true,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        obscureText: isPassword ?? false,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          hintText: hint,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class OwnTextField extends StatelessWidget {
  final String hinttext;
  const OwnTextField({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: transparentwhite,
        labelStyle: TextStyle(color: maingrey),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: transparentwhite,
            width: 2,
          ),
        ),
      ),
    );
  }
}

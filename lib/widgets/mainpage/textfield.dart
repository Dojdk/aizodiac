import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class OwnTextField extends StatelessWidget {
  final TextEditingController controller;
  const OwnTextField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 3,
      minLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: transparentwhite,
        hintText: 'Enter your question',
      ),
    );
  }
}

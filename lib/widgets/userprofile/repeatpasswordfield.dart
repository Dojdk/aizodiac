import 'package:flutter/material.dart';

class RepeatPasswordField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final TextEditingController controllerPassword;
  final GlobalKey<FormState> formkey;
  const RepeatPasswordField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.formkey,
      required this.controllerPassword});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: TextFormField(
        controller: controller,
        textAlignVertical: const TextAlignVertical(y: .2),
        maxLines: 1,
        validator: (value) {
          if (controller.text != controllerPassword.text) {
            return 'Values must be equal';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: hinttext,
            isDense: true,
            contentPadding: const EdgeInsets.only(top: 21, left: 10)),
      ),
    );
  }
}

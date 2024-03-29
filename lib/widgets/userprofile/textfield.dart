import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class OwnTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  const OwnTextField(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.formkey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: TextFormField(
        controller: controller,
        textAlignVertical: const TextAlignVertical(y: .2),
        maxLines: 1,
        validator: (value) {
          if (controller.text.isEmpty && hinttext != 'New password') {
            return 'Please provide a valid value';
          }
          if (hinttext == 'Email' &&
              (!EmailValidator.validate(controller.text))) {
            return 'Please provide a valid value';
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

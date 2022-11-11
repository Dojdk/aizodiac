import 'package:flutter/material.dart';

class OwnTextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  const OwnTextField(
      {super.key, required this.hinttext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Form(
        child: TextFormField(
            controller: controller,
            textAlignVertical: const TextAlignVertical(y: .08),
            maxLines: 1,
            decoration: (const InputDecoration())
                .applyDefaults(Theme.of(context).inputDecorationTheme)
                .copyWith(
                  hintText: hinttext,
                )),
      ),
    );
  }
}

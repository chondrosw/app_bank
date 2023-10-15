import 'dart:io';

import 'package:app_bank/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String title;
  TextEditingController? controller;
  String? placeHolder;
  TextStyle? style;
  bool obsecureText;
  String? error;
  Function(String)? onChanged;
  Function(String?)? onSubmited;
  CustomTextField(
      {super.key,
      required this.title,
      this.style,
      this.placeHolder,
      this.controller,
      this.obsecureText = false,
      this.onChanged,
      this.onSubmited,
      this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style14MediumBlack,
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0, color: error != null ? errorColor : blackColor),
              borderRadius: BorderRadius.circular(14)),
          child: TextFieldPlatform(
            style: style,
            controller: controller,
            placeHolder: placeHolder,
            onChanged: onChanged,
            onSubmited: onSubmited,
            obsecureText: obsecureText,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: error != null
              ? Text(
                  error ?? "",
                  style: style14MediumBlack.copyWith(color: errorColor),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}

class TextFieldPlatform extends StatelessWidget {
  TextEditingController? controller;
  String? placeHolder;
  TextStyle? style;
  bool obsecureText;
  Function(String)? onChanged;
  Function(String?)? onSubmited;
  TextFieldPlatform(
      {super.key,
      this.style,
      this.placeHolder,
      this.controller,
      this.obsecureText = false,
      this.onChanged,
      this.onSubmited});
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTextFormFieldRow(
        onChanged: onChanged,
        controller: controller,
        placeholder: placeHolder,
        style: style,
        obscureText: obsecureText,
        onSaved: onSubmited,
      );
    } else {
      return TextFormField(
        onChanged: onChanged,
        onSaved: onSubmited,
        controller: controller,
        style: style,
        obscureText: obsecureText,
        decoration: InputDecoration(hintText: placeHolder, hintStyle: style),
      );
    }
  }
}

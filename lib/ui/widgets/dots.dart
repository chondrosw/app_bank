import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  int value;
  Dots({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    Widget valueIndicator(int index) {
      if (index == value) {
        return Container(
          width: 16,
          height: 16,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: blueColor),
        );
      } else {
        return Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(shape: BoxShape.circle, color: greyColor),
        );
      }
    }

    return LayoutBuilder(builder: (_, constraint) {
      if (constraint.maxWidth < 600) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) => valueIndicator(index))
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) => valueIndicator(index),)
        );
      }
    });
  }
}

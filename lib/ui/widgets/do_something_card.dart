import 'package:app_bank/model/do_something_model.dart';
import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class DoSomethingCard extends StatelessWidget {
  DoSomethingModel model;
  DoSomethingCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Image.asset(
            width: 26,
            height: 26,
            model.image,
            scale: 2.0,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          model.title,
          style: style14MediumBlack,
        ),
      ],
    );
  }
}

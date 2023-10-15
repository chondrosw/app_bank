import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class FriendlyTipsCard extends StatelessWidget {
  const FriendlyTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 176,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 155,
            height: 98,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/image 16.png"),fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Text(
              "Best tips for using\na credit card",
              style: style14MediumBlack,
            ),
          )
        ],
      ),
    );
  }
}

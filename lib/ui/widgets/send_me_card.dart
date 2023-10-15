import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class SendMeAgainCard extends StatelessWidget {
  const SendMeAgainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius:BorderRadius.circular(20) 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Container(
            width: 45,
            height: 45,
            decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/photo.png"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          Text("@yuanita",style: style14MediumBlack.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}
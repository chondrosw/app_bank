import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class LastestTransactionCard extends StatelessWidget {
  const LastestTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: seaBlueColor),
              child: Image.asset(
                width: 18,
                height: 18,
                "assets/icons/fi_download-2.png",
                scale: 1.0,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top up",
                  style: style16RegularLightBlack.copyWith(
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Yesterday",
                  style: style14MediumBlack.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Text(
          "+ 450.000",
          style: style16SemiboldWhite.copyWith(
              color: blackColor, fontWeight: FontWeight.w400, fontSize: 16),
        )
      ],
    );
  }
}

import 'package:app_bank/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/fi_user.png",
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16,),
            Text("Edit Profile",style: style14MediumBlack,)
          ],
        )
      ],
    );
  }
}

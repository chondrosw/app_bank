import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: style20SemiboldBlack,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: size.width,
              height: size.height * 0.75,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww"),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          width: 32,
                          height: 32,
                          child: Image.asset("assets/icons/ic_check.png")),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Shayna Hanna",
                    style: style18MediumBlack,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        6,
                        (index) => const Column(
                              children: [
                                ProfileCard(),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12,),
            TextButton(onPressed: (){}, child: Text("Report a Problem",style: style16RegularGrey,))
          ],
        ),
      ),
    );
  }
}

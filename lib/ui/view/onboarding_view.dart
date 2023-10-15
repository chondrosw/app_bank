import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/widgets/dots.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int pageValue = 0;
  List<String> titleValue = [
    "Grow Your\nFinancial Today",
    "Build From\nZero to Freedom",
    "Start Together"
  ];

  List<String> subtitleValue = [
    "Our system is helping you to\nachieve a better goal",
    "We provide tips for you so that\nyou can adapt easier",
    "We will guide you to where\nyou wanted it too"
  ];
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget bottomButtonIndicator() {
      switch (pageValue) {
        case 2:
          return Column(
            children: [
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: style16SemiboldWhite,
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: size.width,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      style: style16RegularGrey,
                    )),
              )
            ],
          );
        default:
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 12,
                  width: 48,
                  child: Dots(
                    value: pageValue,
                  )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {},
                  child: Text(
                    "Continue",
                    style: style16SemiboldWhite,
                  ))
            ],
          );
      }
    }

    Widget paddingWithBottom() {
      switch (pageValue) {
        case 2:
          return const SizedBox(
            height: 24,
          );
        default:
          return SizedBox(
            height: size.height * 0.1,
          );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: size.height * 0.4,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (_, index) {
                return Image.asset(
                    "assets/illustration/illustration${index + 1}.png");
              },
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  pageValue = index;
                });
              },
            ),
          ),
          Container(
            height: size.height * 0.4,
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(24)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleValue[pageValue],
                  style: style20SemiboldBlack,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  subtitleValue[pageValue],
                  style: style16RegularGrey,
                  textAlign: TextAlign.center,
                ),
                paddingWithBottom(),
                bottomButtonIndicator()
              ],
            ),
          )
        ],
      ),
    );
  }
}

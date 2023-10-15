import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  int pageIndex = 0;
  bool isAnimated = false;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void animationDo(int valueIndex) {
      setState(() {
        isAnimated = true;
      });

      animationController.forward();
      Future.delayed(Duration(milliseconds: 1600)).then((value) {
        setState(() {
          isAnimated = false;
          pageIndex = valueIndex;
        });
        animationController.reverse();
      }).whenComplete(() => animationController.reset());
    }

    Widget firstInput() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(title: "Full Name"),
          CustomTextField(title: "Email Address"),
          CustomTextField(
            title: "Password",
            obsecureText: true,
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  animationDo(1);
                },
                child: Text(
                  "Continue",
                  style: style16SemiboldWhite,
                )),
          )
        ],
      );
    }

    Widget secondInput() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: darkWhiteColor,
            minRadius: 56,
            child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/icons/fi_upload-cloud.png")),
          ),
          Text(
            "Chondro Satrio",
            style: style18MediumBlack,
            overflow: TextOverflow.ellipsis,
          ),
          CustomTextField(title: "Set PIN (6 digit number)"),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  animationDo(2);
                },
                child: Text(
                  "Continue",
                  style: style16SemiboldWhite,
                )),
          )
        ],
      );
    }

    Widget thirdInput() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: darkWhiteColor,
            minRadius: 56,
            child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/icons/fi_upload-cloud.png")),
          ),
          Text(
            "Passport/ID Card",
            style: style18MediumBlack,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  //animationDo(2);
                },
                child: Text(
                  "Continue",
                  style: style16SemiboldWhite,
                )),
          )
        ],
      );
    }

    Widget switchHandle(int value) {
      switch (pageIndex) {
        case 0:
          return firstInput();
        case 1:
          return secondInput();
        case 2:
          return thirdInput();
        default:
          return Container();
      }
    }

    Widget buttonBottomContent() {
      switch (pageIndex) {
        case 0:
          return TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "sign-in");
              },
              child: Text(
                "Sign in",
                style: style16RegularGrey,
              ));
        case 2:
          return TextButton(
              onPressed: () {},
              child: Text(
                "Skip for Now",
                style: style16RegularGrey,
              ));
        default:
          return Container();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset("assets/logo.png"),
              SizedBox(
                height: size.height * 0.045,
              ),
              Text(
                "Join Us to Unlock\nYour Growth",
                style: style20SemiboldBlack,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                  padding: const EdgeInsets.all(22),
                  width: size.width,
                  height: size.height * 0.475,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.linearToEaseOut,
                      opacity: isAnimated ? 0.0 : 1.0,
                      child: switchHandle(pageIndex))),
              const SizedBox(
                height: 16,
              ),
              buttonBottomContent()
            ],
          ),
        ),
      ),
    );
  }
}

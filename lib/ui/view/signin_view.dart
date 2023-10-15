import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final scaffold = ScaffoldMessenger.of(context);
    return Scaffold(
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
                "Sign In &\nGrow Your Finance",
                style: style20SemiboldBlack,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                  padding: const EdgeInsets.all(22),
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      CustomTextField(
                        title: "Email Address",
                      ),
                      CustomTextField(
                        title: "Password",
                        obsecureText: true,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password",
                                style: style14RegularBlue,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor),
                            onPressed: () {
                              // scaffold.showSnackBar(SnackBar(
                              //   content: Text("Error"),
                              //   action: SnackBarAction(
                              //       label: 'UNDO',
                              //       onPressed: scaffold.hideCurrentSnackBar),
                              // ));
                              scaffold.showMaterialBanner(
                                MaterialBanner(
                                  padding: EdgeInsets.all(20),
                                  content:
                                      Text('Hello, I am a Material Banner'),
                                  leading: Icon(Icons.agriculture_outlined),
                                  backgroundColor: Colors.green,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        scaffold.removeCurrentMaterialBanner();
                                      },
                                      child: Text('DISMISS'),
                                    ),
                                  ],
                                ),
                              );
                              Future.delayed(Duration(seconds: 1))
                                  .then((value) {
                                scaffold.removeCurrentMaterialBanner();
                              });
                            },
                            child: Text(
                              "Sign In",
                              style: style16SemiboldWhite,
                            )),
                      )
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "sign-up");
                  },
                  child: Text(
                    "Create New Account",
                    style: style16RegularGrey,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

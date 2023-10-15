import 'package:app_bank/model/do_something_model.dart';
import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/widgets/do_something_card.dart';
import 'package:app_bank/ui/widgets/friendly_tips_card.dart';
import 'package:app_bank/ui/widgets/lastest_transaction_card.dart';
import 'package:app_bank/ui/widgets/send_me_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var isAnimated = false;
  var animatedLoadingLevel = false;

  ScrollController scrollController = ScrollController();
  //late AnimationController appbarController;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        setState(() {
          animatedLoadingLevel = true;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget profile() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Howdy",
                style: style14MediumBlack,
              ),
              Text(
                "shaynahan",
                style: style20SemiboldBlack,
              )
            ],
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/photo.png"),
                  fit: BoxFit.fill),
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  width: 16,
                  height: 16,
                  child: Image.asset("assets/icons/ic_check.png")),
            ),
          ),
        ],
      );
    }

    Widget appbarAnimation() {
      return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: isAnimated ? SizedBox() : profile(),
      );
    }

    var size = MediaQuery.of(context).size;

    Widget cardSerialNumber() {
      return Container(
        width: size.width,
        padding: const EdgeInsets.all(30),
        height: 241,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: const DecorationImage(
                image: AssetImage("assets/image/card-2.png"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Madelina Bond",
              style: style18MediumWhite,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "**** **** **** 1234",
              style: style18MediumWhite.copyWith(letterSpacing: 6),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Balance",
              style: style14MediumBlack.copyWith(color: whiteColor),
            ),
            Text(
              "\$5000",
              style: style20SemiboldBlack.copyWith(
                  color: whiteColor, fontSize: 24),
            )
          ],
        ),
      );
    }

    Widget levelUpContainer() {
      return Container(
        width: size.width,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Level 1",
                  style: style14MediumBlack,
                ),
                Text.rich(TextSpan(
                    text: "55%",
                    style: style14MediumBlack.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.green),
                    children: [
                      TextSpan(
                          text: " of \$10M",
                          style: style14MediumBlack.copyWith(
                              fontWeight: FontWeight.w500))
                    ]))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: size.width,
                  height: 6,
                  decoration: BoxDecoration(
                      color: lightWhiteColor,
                      borderRadius: BorderRadius.circular(12)),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  width: animatedLoadingLevel ? size.width * 0.5 : 0,
                  height: 6,
                  decoration: BoxDecoration(
                      color: darkgreenColor,
                      borderRadius: BorderRadius.circular(12)),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget doSomethingWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: style16SemiboldWhite.copyWith(color: blackColor),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
              width: size.width,
              height: 116,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    doSomethings.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DoSomethingCard(
                            model: doSomethings[index],
                          ),
                        )),
              ))
        ],
      );
    }

    void onTapDoSomething() {}

    Widget lastestTransaction() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Transactions",
            style: style16SemiboldWhite.copyWith(color: blackColor),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: EdgeInsets.only(bottom: index == 1 ? 0 : 18),
                        child: LastestTransactionCard(),
                      )),
            ),
          )
        ],
      );
    }

    Widget sendAgain() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: style16SemiboldWhite.copyWith(color: blackColor),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
              width: size.width,
              height: 144,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    doSomethings.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SendMeAgainCard(),
                        )),
              )),
        ],
      );
    }

    Widget friendlyTips() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: style16SemiboldWhite.copyWith(color: blackColor),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 12,
            children: List.generate(
                6, (index) => GestureDetector(onTap: ()async{
                  if(await canLaunchUrl(Uri.parse("https://www.google.com"))){
                    launchUrl(Uri.parse("https://www.google.com"));
                  }
                  
                },child: FriendlyTipsCard())),
          )
        ],
      );
    }

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          appbarAnimation(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            height: isAnimated
                ? size.height - 90 - size.height * 0.1
                : size.height - 60 - 90 - size.height * 0.1,
            child: NotificationListener<ScrollNotification>(
              child: ListView(
                controller: scrollController,
                children: [
                  cardSerialNumber(),
                  const SizedBox(
                    height: 20,
                  ),
                  levelUpContainer(),
                  const SizedBox(
                    height: 30,
                  ),
                  doSomethingWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  lastestTransaction(),
                  const SizedBox(
                    height: 30,
                  ),
                  sendAgain(),
                  const SizedBox(
                    height: 30,
                  ),
                  friendlyTips()
                ],
              ),
              onNotification: (notification) {
                if (scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  setState(() {
                    isAnimated = true;
                  });
                }
                if (scrollController.position.userScrollDirection ==
                    ScrollDirection.forward) {
                  setState(() {
                    isAnimated = false;
                  });
                }
                return true;
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:app_bank/shared/theme.dart';
import 'package:app_bank/ui/view/home_view.dart';
import 'package:flutter/material.dart';

class TabBarIndicatorView extends StatefulWidget {
  const TabBarIndicatorView({super.key});

  @override
  State<TabBarIndicatorView> createState() => _TabBarIndicatorViewState();
}

class _TabBarIndicatorViewState extends State<TabBarIndicatorView> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Image.asset("assets/icons/fi_plus-circle.png"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexTab,
        elevation: 0,
        backgroundColor: whiteColor,
        onTap: (value) {
          setState(() {
            indexTab = value;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        selectedLabelStyle:
            style14MediumBlack.copyWith(fontSize: 10, color: blueColor),
        unselectedLabelStyle:
            style14MediumBlack.copyWith(fontSize: 10, color: blackColor),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/fi_layers.png",
                color: indexTab == 0 ? blueColor : blackColor,
              ),
              label: "Overview"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/fi_file-text.png",
                color: indexTab == 1 ? blueColor : blackColor,
              ),
              label: "History"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/fi_trending-up.png",
                color: indexTab == 2 ? blueColor : blackColor,
              ),
              label: "Statistic"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/fi_gift-2.png",
                color: indexTab == 3 ? blueColor : blackColor,
              ),
              label: "Reward")
        ],
      ),
    );
  }
}

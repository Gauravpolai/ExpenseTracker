import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/view/add_subscription/add_subscription_view.dart';
import 'package:expense_tracker/view/calendar/calendar_view.dart';
import 'package:expense_tracker/view/home/home_view.dart';
import 'package:expense_tracker/view/login/sign_in_view.dart';
import 'package:expense_tracker/view/spending_budgets_view/spending_budgets_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectedTab = 0;

  PageStorageBucket pageStorageBucket = PageStorageBucket();
  // Widget currentTabView = HomeView();
  Widget currentTabView = HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/img/bottom_bar_bg.png"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 0;
                                    currentTabView = HomeView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/home.png",
                                  width: 22,
                                  height: 22,
                                  color: selectedTab == 0
                                      ? Colors.white
                                      : TColor.gray30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 1;
                                    currentTabView = SpendingBudgetsView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/budgets.png",
                                  width: 22,
                                  height: 22,
                                  color: selectedTab == 1
                                      ? Colors.white
                                      : TColor.gray30,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                                width: 22,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 2;
                                    currentTabView = CalendarView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/calendar.png",
                                  width: 22,
                                  height: 22,
                                  color: selectedTab == 2
                                      ? Colors.white
                                      : TColor.gray30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 3;
                                    currentTabView = AddSubscriptionView();
                                  });
                                },
                                icon: Image.asset(
                                  "assets/img/creditcards.png",
                                  width: 22,
                                  height: 22,
                                  color: selectedTab == 3
                                      ? Colors.white
                                      : TColor.gray30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: (){ 
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSubscriptionView()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: TColor.secondary.withOpacity(0.25),
                            ),
                          ], borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            "assets/img/center_btn.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

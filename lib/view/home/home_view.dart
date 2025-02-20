import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/custom_arc_painter.dart';
import 'package:expense_tracker/common_widget/segment_button.dart';
import 'package:expense_tracker/common_widget/status_button.dart';
import 'package:expense_tracker/common_widget/subscription_home_row.dart';
import 'package:expense_tracker/common_widget/upcoming_bills.dart';
import 'package:expense_tracker/view/subscription_info_screen/subscription_info_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArray = [
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
      "price": "5.99",
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "18.99",
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "29.99",
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
      "price": "15.00",
    },
  ];
  List bilArr = [
    {
      "name": "Spotify",
      "date": DateTime(2023, 07, 25),
      "price": "5.99",
    },
    {
      "name": "YouTube Premium",
      "date": DateTime(2023, 07, 25),
      "price": "5.99",
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2023, 07, 25),
      "price": "5.99",
    },
    {
      "name": "Netflix",
      "date": DateTime(2023, 07, 25),
      "price": "5.99",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/home_bg.png"),
                  Container(
                    width: media.width * 0.75,
                    height: media.width * 0.75,
                    child: CustomPaint(
                      painter: CustomArcPainter(end: 180),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Text(
                        "\$1,235",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Text(
                        "This month bills",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: media.width * 0.08,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TColor.border.withOpacity(0.15),
                            ),
                            color: TColor.gray60.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "See your Budget",
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Active subs",
                                value: "12",
                                statusColor: TColor.secondary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Hihest Subs",
                                value: "\$19.99",
                                statusColor: TColor.primary10,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Lowest Subs",
                                value: "\$5.9",
                                statusColor: TColor.secondaryG,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Your Subscription",
                      onPressed: () {
                        setState(
                          () {
                            isSubscription = !isSubscription;
                          },
                        );
                      },
                      isActive: isSubscription,
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: "Upcoming Bills",
                      onPressed: () {
                        setState(
                          () {
                            isSubscription = !isSubscription;
                          },
                        );
                      },
                      isActive: !isSubscription,
                    ),
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArray.length,
                itemBuilder: (context, index) {
                  var sObj = subArray[index] as Map? ?? {};
                  return SubscriptionHomeRow(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj)));
                      },
                      sObj: sObj);
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bilArr.length,
                itemBuilder: (context, index) {
                  var sObj = bilArr[index] as Map? ?? {};
                  return UpcomingBills(
                      sObj: sObj,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj)));
                      });
                },
              ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/custom_arc_painter.dart';
import 'package:expense_tracker/common_widget/image_button.dart';
import 'package:expense_tracker/common_widget/primary_button.dart';
import 'package:expense_tracker/common_widget/segment_button.dart';
import 'package:expense_tracker/common_widget/status_button.dart';
import 'package:expense_tracker/common_widget/subscription_home_row.dart';
import 'package:expense_tracker/common_widget/upcoming_bills.dart';
import 'package:flutter/material.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  List subArray = [
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
    },
    {
      "name": "HBO",
      "icon": "assets/img/hbo_logo.png",
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
    },
  ];

  double amountVal = 0.09;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: media.width * 1.1,
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  "assets/img/back.png",
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New",
                              style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Add new\n subscriptions",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.6,
                      child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.65,
                            enlargeFactor: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                            aspectRatio: 1,
                          ),
                          itemCount: subArray.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            var sObj = subArray[itemIndex] as Map? ?? {};
                            return Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    sObj["icon"],
                                    width: media.width * 0.4,
                                    height: media.width * 0.4,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Spacer(),
                                  Text(
                                    sObj["name"],
                                    style: TextStyle(
                                        color: TColor.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageButton(
                      image: "assets/img/minus.png",
                      onPressed: () {
                        amountVal -= 0.1;
                        if (amountVal < 0) {
                          amountVal = 0;
                        }

                        setState(() {});
                      }),
                  Column(
                    children: [
                      Text(
                        "Monthly Price",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "\$${amountVal.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 150,
                        height: 1,
                        color: TColor.gray70,
                      )
                    ],
                  ),
                  ImageButton(
                      image: "assets/img/plus.png",
                      onPressed: () {
                        setState(() {
                          amountVal += 0.1;
                          if (amountVal < 0) {
                            amountVal = 0;
                          }
                        });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:
                  PrimaryButton(title: "Add this platform", onPressed: () {}),
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

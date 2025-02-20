import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/item_row.dart';
import 'package:expense_tracker/common_widget/secondary_button.dart';
import 'package:flutter/material.dart';

class SubscriptionInfoView extends StatefulWidget {
  const SubscriptionInfoView({super.key, required this.sObj});
  final Map sObj;
  @override
  State<SubscriptionInfoView> createState() => _SubscriptionInfoViewState();
}

class _SubscriptionInfoViewState extends State<SubscriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 44),
            decoration: BoxDecoration(
              color: Color(0xff282833).withOpacity(0.9),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: media.width * 0.9,
                      padding: EdgeInsets.all(10),
                      // margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    "assets/img/dorp_down.png",
                                    width: 20,
                                    height: 20,
                                    color: TColor.gray30,
                                  )),
                              Text(
                                "Subscriptions",
                                style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  "assets/img/Trash.png",
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            widget.sObj["icon"],
                            width: media.width * 0.25,
                            height: media.width * 0.25,
                          ),
                          // const Spacer(),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.sObj["name"],
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "\$${widget.sObj["price"]}",
                            style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: media.width * 1.1,
                      margin: const EdgeInsets.all(20),
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Container(
                            height: media.width * 0.9,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: TColor.gray60.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                ItemRow(
                                  title: "Name",
                                  value: widget.sObj["name"],
                                ),
                                ItemRow(
                                  title: "Descriptiong",
                                  value: "Music App",
                                ),
                                ItemRow(
                                  title: "Category",
                                  value: "Entertainment",
                                ),
                                ItemRow(
                                  title: "First Payment",
                                  value: "08.07.2023",
                                ),
                                ItemRow(
                                  title: "Reminder",
                                  value: "Never",
                                ),
                                ItemRow(
                                  title: "Currency",
                                  value: "USD",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SecondaryButton(title: "Save", onPressed: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/budgets_row.dart';
import 'package:expense_tracker/common_widget/custom_arc_180_painter.dart';
import 'package:flutter/material.dart';

class SpendingBudgetsView extends StatefulWidget {
  const SpendingBudgetsView({super.key});

  @override
  State<SpendingBudgetsView> createState() => _SpendingBudgetsViewState();
}

class _SpendingBudgetsViewState extends State<SpendingBudgetsView> {
  List budgetArr = [
    {
      "name": "Auto & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "25.99",
      "total_budget": "400",
      "left_amount": "374.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spend_amount": "50.99",
      "total_budget": "600",
      "left_amount": "549.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spend_amount": "5.99",
      "total_budget": "600",
      "left_amount": "594.01",
      "color": TColor.primary10
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 64,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    width: media.width * 0.5,
                    height: media.width * 0.35,
                    child: CustomPaint(
                      painter: CustomArc180Painter(
                        width: 10,
                        drwArcs: [
                          ArcModel(color: TColor.secondary, value: 30),
                          ArcModel(color: TColor.secondaryG, value: 45),
                          ArcModel(color: TColor.primary10, value: 60),
                        ],
                      ),
                    )),
                Column(
                  children: [
                    Text(
                      "\$82.90",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "of \$ 2,000 budget",
                      style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  height: 64,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColor.border.withOpacity(0.15),
                    ),
                    color: TColor.gray60.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Bill are on track",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetArr.length,
              itemBuilder: (context, index) {
                var sObj = budgetArr[index] as Map? ?? {};
                return BudgetsRow(sObj: sObj, onPressed: () {});
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  height: 64,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColor.border.withOpacity(0.15),
                    ),
                    color: TColor.gray60.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add new Category",
                        style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/img/add.png",
                        color: TColor.gray30,
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

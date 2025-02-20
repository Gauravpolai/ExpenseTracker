import 'package:expense_tracker/common/color_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;
  const SubscriptionCell(
      {super.key, required this.onPressed, required this.sObj});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: TColor.border.withOpacity(0.15),
          ),
          color: TColor.gray60.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sObj["icon"],
              width: 50,
              height: 50,
            ),
            const Spacer(),
            Text(
              sObj["name"],
              style: TextStyle(
                color: TColor.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                color: TColor.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

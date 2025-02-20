import 'package:expense_tracker/common/color_extension.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String title;
  final String value;

  const ItemRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: TColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: TColor.gray30,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Image.asset(
            "assets/img/next.png",
            width: 20,
            height: 20,
            color: TColor.gray30,
          ),
        ],
      ),
    );
  }
}

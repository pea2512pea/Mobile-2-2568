import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyBox extends StatelessWidget {
  final String title;
  final double amount;
  final double sizeConHeight;
  final Color colorSet;

  const MoneyBox({super.key, required this.title, required this.amount, required this.sizeConHeight, required this.colorSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: colorSet,
        borderRadius: BorderRadius.circular(20),
      ),
      height: sizeConHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              softWrap: false,
              NumberFormat("#,###.###").format(amount).toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

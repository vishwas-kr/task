import 'package:flutter/material.dart';
import 'package:task/components/constant.dart';

class SalesContainer extends StatelessWidget {
  const SalesContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.totalSales
  }) : super(key: key);

  final double height;
  final double width;
  final String totalSales;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: width,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: kPurple, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('TOTAL SALE', style: kFontStyle1),
          Text(
            'Rs. $totalSales',
            style: kFontStyle1.copyWith(fontSize: 22),
          )
        ],
      ),
    );
  }
}

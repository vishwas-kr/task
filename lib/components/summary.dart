
import 'package:flutter/material.dart';
import 'package:task/components/constant.dart';

import '../data/data.dart';

class SummarySlider extends StatelessWidget {
  const SummarySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: summary.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: ((context, constraints) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: constraints.maxHeight * 0.5,
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        summary[index].heading,
                        textAlign: TextAlign.center,
                        style: kFontStyle2,
                      ),
                      Text(
                        "${summary[index].quantity}",
                        style: kFontStyle2,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:task/components/constant.dart';

class LineChartDesign extends StatelessWidget {
  const LineChartDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 1,
        minY: 0,
        maxX: 7,
        maxY: 25000,
        gridData: FlGridData(
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
          border: const Border(
            left: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
        titlesData: LineTile.getTileData(),
        lineBarsData: [
          LineChartBarData(
            colors: [kPurple],
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(show: false),
            isStepLineChart: false,
            spots: const [
              FlSpot(1, 2000),
              FlSpot(2, 2000),
              FlSpot(3, 900),
              FlSpot(4, 8000),
              FlSpot(5, 6000),
              FlSpot(6, 10000),
              FlSpot(7, 20000)
            ],
          ),
          LineChartBarData(
            colors: [kViolet],
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(show: false),
            spots: const [
              FlSpot(1, 5000),
              FlSpot(2, 4000),
              FlSpot(3, 20000),
              FlSpot(4, 10000),
              FlSpot(5, 6000),
              FlSpot(6, 10000),
              FlSpot(7, 3000)
            ],
          ),
        ],
      ),
    );
  }
}

class LineTile {
  static getTileData() => FlTitlesData(
        bottomTitles: SideTitles(
            showTitles: true,
            margin: 8,
            reservedSize: 22,
            getTextStyles: (value, context) => const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'Sun';
                case 2:
                  return 'Mon';
                case 3:
                  return 'Tue';
                case 4:
                  return 'Wed';
                case 5:
                  return 'Thu';
                case 6:
                  return 'Fri';
                case 7:
                  return 'Sat';
              }
              return '';
            }),
        leftTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            interval: 2,
            getTextStyles: (value, context) => const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2000:
                  return '₹ 2K';
                case 5000:
                  return '₹ 5K';
                case 10000:
                  return '₹ 10K';
                case 15000:
                  return '₹ 15K';
                case 20000:
                  return '₹ 20K';
                case 25000:
                  return '₹ 25K';
              }
              return '';
            }),
        rightTitles: SideTitles(
          showTitles: false,
        ),
        topTitles: SideTitles(
          showTitles: false,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:task/components/chart_container.dart';
import 'package:task/components/constant.dart';

import 'package:task/components/line_chart.dart';
import 'package:task/components/summary.dart';
import 'package:task/data/data.dart';

import '../components/sales_container.dart';
import '../model/foodModel.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late List<Food> _foood;
  //late FoodDataSource _foodDataSource;
  @override
  void initState() {
    _foood = getFoodData();
    //_foodDataSource = FoodDataSource(_foood);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 90,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(left: 12, bottom: 10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlue],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Image.asset("images/logo.png"),
                  ),
                ),
                const ChartContainer(chart: LineChartDesign()),
                SalesContainer(
                  height: height,
                  width: width,
                  totalSales: "22,7769",
                ),
                SizedBox(
                  height: height * 0.12,
                  width: width,
                  child: const SummarySlider(),
                ),

                //Grid Table
                const SizedBox(height: 20),
                Text(
                  "Top 5 Selling Items",
                  style: kFontStyle2.copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfDataGrid(
                    verticalScrollPhysics: const NeverScrollableScrollPhysics(),
                    source: FoodDataSource(_foood),
                    shrinkWrapRows: true,
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    columns: [
                      GridColumn(
                        columnName: 'id',
                        label: Container(
                          width: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'ID',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Item',
                        label: Container(
                          width: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Item',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Quantity',
                        label: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Quantity',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Price',
                        label: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Price',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class FoodDataSource extends DataGridSource {
  FoodDataSource(List<Food> employees) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'id', value: dataGridRow.icon),
              DataGridCell<String>(columnName: 'Item', value: dataGridRow.item),
              DataGridCell<String>(
                  columnName: 'Quantity', value: dataGridRow.quantity),
              DataGridCell<int>(columnName: 'Price', value: dataGridRow.price),
            ]))
        .toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
}

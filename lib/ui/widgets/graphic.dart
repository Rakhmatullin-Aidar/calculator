import 'package:calculator/data/models/calculation/calculation_model.dart';
import 'package:calculator/ui/widgets/hat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartGraphic extends StatefulWidget {
  const BarChartGraphic({
    Key? key,
    required this.calculation,
  }) : super(key: key);

  final Calculation calculation;

  @override
  State<BarChartGraphic> createState() => _BarChartGraphicState();
}

class _BarChartGraphicState extends State<BarChartGraphic> {
  late double amount;
  late double totalAmount;

  @override
  void initState() {
    super.initState();
    amount = double.parse(widget.calculation.amount);
    totalAmount = double.parse(widget.calculation.totalAmount);
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            child: Hat(),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: (30 * double.parse(widget.calculation.term)),
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return BarChart(
                      BarChartData(
                        barTouchData: BarTouchData(
                          enabled: false,
                        ),
                        alignment: BarChartAlignment.start,
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 24,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (value) => value % 10 == 0,
                          drawVerticalLine: false,
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        groupsSpace: 30,
                        barGroups: getData(10, 10),
                      ),
                      swapAnimationDuration: Duration.zero,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    List<BarChartGroupData> list = [];
    for (int i = 0; i < double.parse(widget.calculation.term); i++) {
      if (widget.calculation.paymentType == 'Аннуитетный') {
        amount += amount * double.parse(widget.calculation.percent) / 100 -
            double.parse(widget.calculation.monthlyPayment);

        list.add(
          BarChartGroupData(
            x: i + 1,
            barsSpace: barsSpace,
            barRods: [
              BarChartRodData(
                toY: double.parse(widget.calculation.amount) + double.parse(widget.calculation.monthlyPayment),
                rodStackItems: [
                  BarChartRodStackItem(
                    0,
                    amount,
                    Colors.red,
                  ),
                  BarChartRodStackItem(
                    amount,
                    amount + double.parse(widget.calculation.monthlyPayment),
                    Colors.greenAccent,
                  ),
                ],
                borderRadius: BorderRadius.zero,
                width: barsWidth,
                color: Colors.transparent,
              ),
            ],
          ),
        );
      } else {
        totalAmount =
            totalAmount - double.parse(widget.calculation.monthlyPayment);

        list.add(
          BarChartGroupData(
            x: i + 1,
            barsSpace: barsSpace,
            barRods: [
              BarChartRodData(
                toY: double.parse(widget.calculation.totalAmount),
                rodStackItems: [
                  BarChartRodStackItem(
                    0,
                    totalAmount,
                    Colors.red,
                  ),
                  BarChartRodStackItem(
                    totalAmount,
                    totalAmount +
                        double.parse(widget.calculation.monthlyPayment),
                    Colors.greenAccent,
                  ),
                ],
                borderRadius: BorderRadius.zero,
                width: barsWidth,
                color: Colors.transparent,
              ),
            ],
          ),
        );
      }
    }
    return list;
  }
}
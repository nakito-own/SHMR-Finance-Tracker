import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'balance_entry.dart';

class BalanceChartView extends StatefulWidget {
  final String daysLabel;
  final String monthsLabel;

  const BalanceChartView({
    Key? key,
    required this.daysLabel,
    required this.monthsLabel,
  }) : super(key: key);

  @override
  State<BalanceChartView> createState() => _BalanceChartViewState();
}

class _BalanceChartViewState extends State<BalanceChartView> {
  late List<BalanceEntry> _dailyData;
  int _segment = 0;

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    final now = DateTime.now();
    final random = Random();
    _dailyData = List.generate(30, (i) {
      final date = now.subtract(Duration(days: 29 - i));
      final balance = random.nextDouble() * 400 - 200;
      return BalanceEntry(date, balance);
    });
  }

  List<BalanceEntry> get _monthlyData {
    final Map<int, BalanceEntry> map = {};
    for (final e in _dailyData) {
      final key = e.date.month;
      final current = map[key];
      if (current == null || current.date.isBefore(e.date)) {
        map[key] = e;
      }
    }
    final list = map.values.toList();
    list.sort((a, b) => a.date.compareTo(b.date));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final data = _segment == 0 ? _dailyData : _monthlyData;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CupertinoSlidingSegmentedControl<int>(
            groupValue: _segment,
            children: {
              0: Text(widget.daysLabel),
              1: Text(widget.monthsLabel),
            },
            onValueChanged: (v) => setState(() => _segment = v ?? 0),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                alignment: BarChartAlignment.spaceBetween,
                gridData: FlGridData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, idx, rod, i) {
                      final entry = data[group.x.toInt()];
                      return BarTooltipItem(
                        '${DateFormat.yMd().format(entry.date)}\n${entry.balance.toStringAsFixed(0)}',
                        const TextStyle(color: Colors.black),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= data.length) return const SizedBox.shrink();
                        if (index != 0 && index != data.length - 1 && index % 5 != 0) {
                          return const SizedBox.shrink();
                        }
                        final date = data[index].date;
                        final text = _segment == 0
                            ? DateFormat.Md().format(date)
                            : DateFormat.MMM().format(date);
                        return Text(text, style: const TextStyle(fontSize: 10));
                      },
                    ),
                  ),
                ),
                barGroups: [
                  for (var i = 0; i < data.length; i++)
                    BarChartGroupData(x: i, barRods: [
                      BarChartRodData(
                        toY: data[i].balance.abs(),
                        color: data[i].balance < 0 ? Colors.red : Colors.green,
                        width: 8,
                        borderRadius: BorderRadius.circular(6),
                      )
                    ])
                ],
                minY: 0,
              ),
              swapAnimationDuration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      ],
    );
  }
}

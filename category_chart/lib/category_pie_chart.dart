import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'pie_data.dart';

class CategoryPieChart extends StatefulWidget {
  final List<PieData> data;
  final Color backgroundColor;
  final Duration animationDuration;
  final double size;
  final double ringThickness;

  const CategoryPieChart({
    Key? key,
    required this.data,
    this.backgroundColor = Colors.white,
    this.animationDuration = const Duration(milliseconds: 800),
    this.size = 180.0,
    this.ringThickness = 8.0,
  }) : super(key: key);

  @override
  State<CategoryPieChart> createState() => _CategoryPieChartState();
}

class _CategoryPieChartState extends State<CategoryPieChart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late List<PieData> _oldData;

  @override
  void initState() {
    super.initState();
    _oldData = List.from(widget.data);
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..forward();
  }

  @override
  void didUpdateWidget(covariant CategoryPieChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_listEquals(oldWidget.data, widget.data)) {
      _oldData = List.from(oldWidget.data);
      _controller.forward(from: 0);
    }
  }

  bool _listEquals(List<PieData> a, List<PieData> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].label != b[i].label ||
          a[i].value != b[i].value ||
          a[i].color != b[i].color) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildChart(List<PieData> data) {
    final double outerRadius = widget.size / 2;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: PieChart(
        PieChartData(
          // Полная заливка (дырку не делаем)
          centerSpaceRadius: 0,
          sectionsSpace: 0,
          sections: data.map((item) {
            return PieChartSectionData(
              color: item.color,
              value: item.value,
              title: '',
              // явно указываем внешний радиус
              radius: outerRadius,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCenterText(List<PieData> data) {
    final total = data.fold<double>(0, (sum, e) => sum + e.value);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: data.map((item) {
        final pct = total == 0 ? 0.0 : item.value / total * 100;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${item.label}: ${pct.toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = _controller.value;
    final oldOpacity = progress < 0.5 ? 1 - progress * 2 : 0.0;
    final newOpacity = progress >= 0.5 ? (progress - 0.5) * 2 : 1.0;
    final oldAngle = progress * math.pi;
    final newAngle =
    progress < 0.5 ? 0.0 : math.pi + (progress - 0.5) * math.pi;

    double innerDiameter = widget.size - 2 * widget.ringThickness;
    if (innerDiameter < 0) innerDiameter = 0.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (oldOpacity > 0)
          Opacity(
            opacity: oldOpacity,
            child: Transform.rotate(
              angle: oldAngle,
              child: _buildChart(_oldData),
            ),
          ),
        Opacity(
          opacity: newOpacity,
          child: Transform.rotate(
            angle: newAngle,
            child: _buildChart(widget.data),
          ),
        ),
        Container(
          width: innerDiameter,
          height: innerDiameter,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: _buildCenterText(widget.data)),
        ),
      ],
    );
  }
}

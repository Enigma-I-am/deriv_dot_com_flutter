import 'package:deriv_dot_com_flutter/core/models/binanry_tick_model.dart';
import 'package:deriv_dot_com_flutter/deriv_tracker/cubit/devir_tracker_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TrackerChart extends StatefulWidget {
  final DevirTrackerState state;
  const TrackerChart(this.state, {Key? key}) : super(key: key);

  @override
  TrackerChartState createState() => TrackerChartState();
}

class TrackerChartState extends State<TrackerChart> {
  var ticks = <Tick>[];

  @override
  Widget build(BuildContext context) {
    // final tick = widget.state.activeSymbols.tick;
    // if (tick.id.isNotEmpty) {
    //   ticks.insert(0, tick);
    // }
    // ticks = ticks.take(50).toList();
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.7,
          child: Container(
            padding: const EdgeInsets.only(top: 24, bottom: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Colors.transparent,
            ),
            width: double.maxFinite,
            child: LineChart(mainData),
          ),
        ),
      ],
    );
  }

  LineChartData get mainData {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.black.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.black.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            getTitlesWidget: (_, __) => const Offstage(),
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: (_, __) => const Offstage(),
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 6),
          ],

          // ticks.reversed
          //     .map((it) => FlSpot(it.epoch.toDouble(), it.quote))
          //     .toList(),
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

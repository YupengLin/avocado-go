// import 'package:flutter/cupertino.dart';
//
// class fiveyear extends StatefulWidget {
//   const fiveyear({Key? key}) : super(key: key);
//
//   @override
//   State<fiveyear> createState() => _fiveyearState();
// }
//
// class _fiveyearState extends State<fiveyear> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/utils/medeiaqury/medeiaqury.dart';

class fiveyear extends StatefulWidget {
  const fiveyear({Key? key}) : super(key: key);

  @override
  State<fiveyear> createState() => _fiveyearState();
}

class _fiveyearState extends State<fiveyear> {
  late ColorNotifier notifier;
  int touchedIndex = -1;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: LineChart(
                onedaymainData(notifier.getbluecolor, 0.1),
              ),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                touchedIndex = -1;
              });
            },
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: const <Widget>[],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData onedaymainData(color, opcity) {
    List<Color> colors = [color, color];
    Gradient gradientColors = LinearGradient(colors: colors);
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(strokeWidth: 1, color: Colors.transparent);
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 20,
            interval: 8,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Colors.white, width: 0)),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 2),
            const FlSpot(1, 1),
            const FlSpot(2, 2),
            const FlSpot(3, 3),
            const FlSpot(4, 4),
            const FlSpot(5, 2),
            const FlSpot(6, 1),
            const FlSpot(7, 3),
            const FlSpot(8, 3),
            const FlSpot(9, 1),
            const FlSpot(10, 2),
          ],
          isCurved: true,
          gradient: gradientColors,
          barWidth: 2,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                colors:
                    colors.map((color) => color.withOpacity(opcity)).toList()),
          ),
        ),
      ],
    );
  }
}

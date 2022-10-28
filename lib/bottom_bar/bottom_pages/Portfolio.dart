// import 'package:calendar_calendar/calendar_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:avocado_go/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:avocado_go/Custom_BlocObserver/notifire_clor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../Stock_Detail.dart';
import 'market_cap.dart' show market_cap_volume, collections;
import 'package:intl/intl.dart';
import 'dart:math';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late ColorNotifier notifier;

  // late List<GDPData> _chartData;
  // late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    generate_data();
    generate_collection_distribution();
  }

  List<ChartData> chartData = [];
  List<ChartData> capChartData = [];
  var meta;
  final _random = Random();
  List<DateTime> max_min = [];
  void generate_data() {
    var data = market_cap_volume["volumeEth"]!;
    meta = data["meta"] as Map<String, dynamic>;
    var xy = data["values"] as Map<String, List>;
    for (var i = 0; i < xy["x"]!.length; i++) {
      // print(xy["x"]![i]);
      var date_time = DateTime.fromMillisecondsSinceEpoch(xy["x"]![i]).toUtc();
      //MM-dd-yyyy
      // var date_time_str = DateFormat("dd MMM ").format(date_time);
      chartData.add(ChartData(date_time, xy["y"]![i]));
    }

    var market_cap_data = market_cap_volume["marketCapEth"]!;
    // meta = data["meta"] as Map<String, dynamic>;
    var xy_cap = market_cap_data["values"] as Map<String, List>;

    for (var i = 0; i < xy_cap["x"]!.length; i++) {
      // print(xy["x"]![i]);
      var date_time =
          DateTime.fromMillisecondsSinceEpoch(xy_cap["x"]![i]).toUtc();

      //MM-dd-yyyy
      // var date_time_cap_str = DateFormat("dd MMM hh:mm").format(date_time);
      // print(xy_cap["y"]![i]);
      // print(date_time_cap_str);
      capChartData.add(ChartData(date_time, xy_cap["y"]![i]));
    }
    max_min.add(capChartData[0].x);
    max_min.add(capChartData[capChartData.length - 1].x);
  }

  List<CircularChartData> circularChartData = [];
  void generate_collection_distribution() {
    List<dynamic>? cols = collections["marketCapEth"];

    for (var i = 0; i < cols!.length; i++) {
      var cat = cols[i]["collection"] ?? {"name": "Others"};
      // print(cat);
      // as Map<String, dynamic>)["name"];
      circularChartData.add(CircularChartData(
          cat["name"],
          cols[i]["value"],
          cols[i]["ratio"],
          Color.fromARGB(_random.nextInt(256), _random.nextInt(256),
              _random.nextInt(256), _random.nextInt(256))));
    }
    // print(circularChartData);
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
            notifier.getwihitecolor, "Portfolio", notifier.getblck,
            height: height / 15),
        body: Column(
          children: [
            SizedBox(height: height / 40),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const Stock_Detail());
                  },
                  child: up_down_rate("assets/images/Today_Gains.png",
                      "😄321,198", "30D Profit"),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(const Stock_Detail());
                  },
                  child: up_down_rate("assets/images/Overall Loss.png",
                      "😭205,321", "30D Loss"),
                ),
                SizedBox(width: width / 15),
              ],
            ),
            SizedBox(height: height / 25),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  "Volume(7D)",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: notifier.getgrey,
                      fontFamily: 'Gilroy_Medium'),
                ),
                const Spacer(),
                Image.asset("assets/images/ball.png", height: height / 20),
                SizedBox(width: width / 15),
              ],
            ),
            SizedBox(height: height / 200),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  double.parse(meta["value"].toString()).toStringAsFixed(2),
                  style: TextStyle(
                      color: notifier.getblck,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 27.sp),
                ),
              ],
            ),
            SizedBox(height: height / 200),
            // Row(
            //   children: [
            //     SizedBox(width: width / 25),
            //     const Icon(
            //       Icons.arrow_drop_up_outlined,
            //       color: Color(0xff19C09A),
            //     ),
            //     Text(
            //       "65.63 (76,23%)",
            //       style: TextStyle(
            //           color: const Color(0xff19C09A),
            //           fontSize: 12.sp,
            //           fontFamily: 'Gilroy_Bold'),
            //     ),
            //     SizedBox(width: width / 100),
            //     Text(
            //       "Today",
            //       style: TextStyle(
            //           color: notifier.getgrey,
            //           fontSize: 12.sp,
            //           fontFamily: 'Gilroy_Bold'),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 50),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      column_chart(),
                      SizedBox(height: height / 80),
                      Row(
                        children: [
                          SizedBox(width: width / 20),
                          Text(
                            "Collection Distribution",
                            style: TextStyle(
                                color: notifier.getblck,
                                fontSize: 18.sp,
                                fontFamily: 'Gilroy_Bold'),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 30),
                      circular_chart(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(const Stock_Detail());
                      //   },
                      //   child: custtom_button("assets/images/kotok.png",
                      //       "Kotak Bank", "Kotak PVL.", "\$326,23", "2,87%"),
                      // ),
                      // SizedBox(height: height / 30),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(const Stock_Detail());
                      //   },
                      //   child: custtom_button("assets/images/hdfc.png",
                      //       "HDFC bank", "HDFC Inc.", "\$252,12", "10.03%"),
                      // ),
                      // SizedBox(height: height / 30),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(const Stock_Detail());
                      //   },
                      //   child: custtom_button("assets/images/Ambuja_logo.png",
                      //       "Ambuja Cement", "Ambuja", "\$360,23", "10.03%"),
                      // ),
                      // SizedBox(height: height / 30),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(const Stock_Detail());
                      //   },
                      //   child: custtom_button("assets/images/airtel.jpg",
                      //       "Airtel bharti", "Airtel", "\$326,23", "2,87%"),
                      // ),
                      // SizedBox(height: height / 30),
                      // GestureDetector(
                      //   onTap: () {
                      //     Get.to(const Stock_Detail());
                      //   },
                      //   child: custtom_button(
                      //       "assets/images/icici.png",
                      //       "icici lombard gen.",
                      //       "icici",
                      //       "\$360,23",
                      //       "10,03%"),
                      // ),
                      // SizedBox(height: height / 30),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget circular_chart() {
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        // Legend will be placed at the left
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries>[
        DoughnutSeries<CircularChartData, String>(
          dataSource: circularChartData,
          pointColorMapper: (CircularChartData data, _) => data.color,
          xValueMapper: (CircularChartData data, _) => data.x,
          yValueMapper: (CircularChartData data, _) => data.y,
        ),
      ],
    );
  }

  Widget column_chart() {
    return SfCartesianChart(
        primaryXAxis: DateTimeCategoryAxis(
          dateFormat: DateFormat()
              // .add_MMMd()
              .add_Md(), // to display abbreviated weekday
          intervalType: DateTimeIntervalType.days,
          rangePadding: ChartRangePadding.auto,
          // labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          // edgeLabelPlacement: EdgeLabelPlacement.shift,
          visibleMinimum: max_min[0], // Decreased duration by 12 hours
          visibleMaximum: max_min[1],
          interval: 1,
          //     .add(Duration(hours: 12)), // increased duration by 12 hours
        ),
        primaryYAxis: NumericAxis(
            numberFormat: NumberFormat.compact(), name: "Market Cap(ETH)"),
        enableAxisAnimation: true,
        axes: <ChartAxis>[
          NumericAxis(
              name: 'Volume(ETH)',
              opposedPosition: true,
              title: AxisTitle(text: 'Volume(ETH)'),
              numberFormat: NumberFormat.compact()),
        ],
        // annotations: const <CartesianChartAnnotation>[
        //   CartesianChartAnnotation(
        //       coordinateUnit: CoordinateUnit.percentage,
        //       region: AnnotationRegion.plotArea,
        //       widget: Text('',
        //           style: TextStyle(
        //             fontSize: 14,
        //           )),
        //       x: '50%',
        //       y: '50%')
        // ],
        series: <ChartSeries>[
          ColumnSeries<ChartData, DateTime>(
              color: notifier.getbluecolor,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y.round(),
              xAxisName: "Month",
              yAxisName: "Volume(ETH)"),
          LineSeries<ChartData, DateTime>(
            color: Color.fromARGB(255, 180, 97, 248),
            dataSource: capChartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            yAxisName: "Market Cap(ETH)",
            xAxisName: "Month",
          ),
        ]);
  }

  Widget up_down_rate(image, rate, days) {
    return Container(
      color: notifier.getwihitecolor,
      height: height / 12,
      width: width / 2.2,
      child: Card(
        color: notifier.getwihitecolor,
        elevation: 1,
        child: Row(
          children: [
            SizedBox(width: width / 20),
            Image.asset(
              image,
              height: height / 17,
            ),
            SizedBox(width: width / 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 100),
                Text(
                  rate,
                  style: TextStyle(
                    color: notifier.getblck,
                    fontSize: 17.sp,
                    fontFamily: 'Gilroy_Bold',
                  ),
                ),
                Text(
                  days,
                  style: TextStyle(
                    color: notifier.getgrey,
                    fontSize: 13.sp,
                    fontFamily: 'Gilroy_Medium',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  const ChartData(this.x, this.y);

  final DateTime x;
  final double y;
}

class CircularChartData {
  const CircularChartData(this.x, this.y, this.z, this.color);

  final String x;
  final double y;
  final double z;
  final Color color;
}

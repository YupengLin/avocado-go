import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:avocado_go/Custom_BlocObserver/Custtom_stoc/Custtom_stoc.dart';
import 'package:avocado_go/Custom_BlocObserver/Stock%20Gains%20card/Stock_Gains_card.dart';
import 'package:avocado_go/Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import 'package:avocado_go/Custom_BlocObserver/notifire_clor.dart';
import 'package:avocado_go/bottom_bar/bottom_pages/stock_exchange_tabs/Select%20Stocks.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../Stock_Detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ColorNotifier notifier;

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.sp),
            // here the desired height
            child: AppBar(
              elevation: 0,
              backgroundColor: notifier.getwihitecolor,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 70, width: width),
                  Text(
                    "Hola",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy-Regular'),
                  ),
                  Text(
                    "Welcome to Avocado",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: notifier.getblck,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: width / 18),
              Custtom_Stock_Gains_card(),
              SizedBox(height: height / 30),
              Row(
                children: [
                  SizedBox(width: width / 15),
                  Text(
                    "Portfolio",
                    style: TextStyle(
                        color: notifier.getblck,
                        fontSize: 18.sp,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                  SizedBox(width: width / 1.8),
                  GestureDetector(
                    onTap: () {
                      Get.to(const SelectStocks());
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: height / 4.7,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/RBL.jpg",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/airtel.jpg",
                                "Airtel Bharti",
                                "Airtel",
                                "Portfolio",
                                "\$326,423",
                                "2,87%",
                                const Color(0xff19C09A),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/Ambuja_logo.png",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/airtel.jpg",
                                "Airtel Bharti",
                                "Airtel",
                                "Portfolio",
                                "\$326,423",
                                "2,87%",
                                const Color(0xff19C09A),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/RBL.jpg",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: width / 15),
                      Text(
                        "Watchlist",
                        style: TextStyle(
                            color: notifier.getblck,
                            fontSize: 18.sp,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 27),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(const Stock_Detail());
                          },
                          child: custtom_button(
                              "assets/images/Ambuja_logo.png",
                              "Ambuja Cement",
                              "Ambuja.",
                              "\$2,196.05",
                              "10,03%")),
                      SizedBox(height: height / 40),
                      GestureDetector(
                          onTap: () {
                            Get.to(const Stock_Detail());
                          },
                          child: custtom_button(
                              "assets/images/kotok.png",
                              "Kotak Mahindra",
                              "Kotak Bank.",
                              "\$326,23",
                              "2,87%")),
                      SizedBox(height: height / 40),
                      GestureDetector(
                          onTap: () {
                            Get.to(const Stock_Detail());
                          },
                          child: custtom_button(
                              "assets/images/icici.png",
                              "icici lombard gen.",
                              "icici",
                              "\$360,23",
                              "10,03%")),
                      SizedBox(height: height / 40),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width / 15),
                      Image.asset("assets/images/investment.png",
                          height: height / 17),
                      SizedBox(width: width / 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Investment Tips",
                            style: TextStyle(
                              color: notifier.getInvestmentbluecolor,
                              fontSize: 15.sp,
                              fontFamily: 'Gilroy_Bold',
                            ),
                          ),
                          Text(
                            "Plan ahead for panicky times",
                            style: TextStyle(
                              color: notifier.getInvestmentbluecolor,
                              fontSize: 10.sp,
                              fontFamily: 'Gilroy-Regular',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height / 30),
                  Row(
                    children: [
                      SizedBox(width: width / 15),
                      Text(
                        "Top Stocks",
                        style: TextStyle(
                            color: notifier.getblck,
                            fontSize: 18.sp,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                      SizedBox(width: width / 2.1),
                      GestureDetector(
                        onTap: () {
                          Get.to(const SelectStocks());
                        },
                        child: Text(
                          "View all",
                          style: TextStyle(
                              color: notifier.getbluecolor,
                              fontSize: 12.sp,
                              fontFamily: 'Gilroy_Medium'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 50),
                  Container(
                    height: height / 4.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/RBL.jpg",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/airtel.jpg",
                                "Airtel Bharti",
                                "Airtel",
                                "Portfolio",
                                "\$326,423",
                                "2,87%",
                                const Color(0xff19C09A),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/Ambuja_logo.png",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/airtel.jpg",
                                "Airtel Bharti",
                                "Airtel",
                                "Portfolio",
                                "\$326,423",
                                "2,87%",
                                const Color(0xff19C09A),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const Stock_Detail());
                              },
                              child: Custtom_stoc(
                                "assets/images/RBL.jpg",
                                "RBL Bank",
                                "RBL",
                                "Portfolio",
                                "\$131,46",
                                "2,02%",
                                const Color(0xffFC6C6B),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: height / 10,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: width / 17),
                            Container(
                              width: width / 3,
                              height: height / 30,
                              child: LineChart(
                                mainData(const Color(0xffFC6C6B)),
                              ),
                            ),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  touchedIndex = -1;
                                });
                              },
                              onTap: () {},
                              child: Row(
                                children: const <Widget>[],
                              ),
                            ),
                            SizedBox(width: width / 7),
                            Container(
                              width: width / 3,
                              height: height / 30,
                              child: LineChart(
                                mainData(Color(0xff19C09A)),
                              ),
                            ),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  touchedIndex = -1;
                                });
                              },
                              onTap: () {},
                              child: Row(
                                children: const <Widget>[],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),

              // Expanded(
              //   child: ListView.builder(
              //     padding:  EdgeInsets.zero,
              //     itemCount: 1,
              //     itemBuilder: (context, index) {
              //       return
              //     },
              //   ),
              // ),
              // FlutterSwitch(
              //     value: notifier.getIsDark,
              //     onToggle: (val) {
              //       notifier.setIsDark = val;
              //     }),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData mainData(color) {
    List<Color> colors = [color, color];

    Gradient gradientColors = LinearGradient(colors: colors);

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(strokeWidth: 1, color: Colors.yellow);
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
          show: true,
          border: Border.all(color: notifier.getbluecolor, width: 0)),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 2.5),
            const FlSpot(1, 2),
            const FlSpot(2, 4),
            const FlSpot(3, 3.1),
            const FlSpot(4, 4),
            const FlSpot(5, 2),
            const FlSpot(6, 4),
            const FlSpot(7, 3.1),
            const FlSpot(8, 2),
            const FlSpot(9, 1.5),
            const FlSpot(10, 3),
          ],
          isCurved: true,
          gradient: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                colors: colors.map((color) => color.withOpacity(0.1)).toList()),
          ),
        ),
      ],
    );
  }
}

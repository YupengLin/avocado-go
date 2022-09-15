import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../notifire_clor.dart';

// ignore: must_be_immutable
class Custtom_stoc extends StatefulWidget {
  String? image;
  String? title;
  String? subtitle;
  String? stocktitle;
  String? stockprice;
  String? up_down;
  Color? iconcolor;
  Custtom_stoc(this.image, this.title, this.subtitle, this.stocktitle,
      this.stockprice, this.up_down, this.iconcolor);

  @override
  State<Custtom_stoc> createState() => _Custtom_stocState();
}

class _Custtom_stocState extends State<Custtom_stoc> {
  late ColorNotifier notifier;
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
    return ScreenUtilInit(
      builder: (context, child) => Container(
        margin: EdgeInsets.only(left: width / 15),
        height: height / 5,
        width: width / 2.1,
        color: notifier.getwihitecolor,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width / 20, top: height / 60),
                  child: Image.asset(widget.image!, height: height / 20),
                ),
                SizedBox(width: width / 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height / 50),
                    Text(
                      widget.title!,
                      style: TextStyle(
                          color: notifier.getblck,
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                    Text(
                      widget.subtitle!,
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontSize: 11.sp,
                          fontFamily: 'Gilroy-Regular'),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              children: [
                SizedBox(width: width / 25),
                Text(
                  widget.stocktitle!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Gilroy-Regular',
                      color: notifier.getgrey),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: width / 25),
                Text(
                  widget.stockprice!,
                  style: TextStyle(
                      color: notifier.getblck,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 19.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: widget.iconcolor!,
                ),
                Text(
                  widget.up_down!,
                  style: TextStyle(
                      color: const Color(0xffFC6C6B), fontSize: 13.sp),
                ),
                SizedBox(width: width / 25),
              ],
            )
          ],
        ),
      ),
    );
  }
}

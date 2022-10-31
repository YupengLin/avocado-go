import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../Custom_BlocObserver/swiper/swiper.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Spash_Screen extends StatefulWidget {
  @override
  State<Spash_Screen> createState() => _Spash_ScreenState();
}

class _Spash_ScreenState extends State<Spash_Screen> {
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
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => swiper(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.getbluecolor,
      body: Center(
          child: Image.asset("assets/images/avocado_logo.png",
              height: height / 4)),
    );
  }
}

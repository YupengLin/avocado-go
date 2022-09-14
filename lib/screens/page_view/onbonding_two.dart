import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gogrow/Custom_BlocObserver/button/custtom_button.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/screens/Auth/Login.dart';
import 'package:gogrow/screens/Auth/Sign%20Up.dart';

import '../../utils/medeiaqury/medeiaqury.dart';

class onbondingtwo extends StatefulWidget {
  const onbondingtwo({Key? key}) : super(key: key);

  @override
  State<onbondingtwo> createState() => _onbondingtwoState();
}

class _onbondingtwoState extends State<onbondingtwo> {
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
      builder: () => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 6),
              Image.asset("assets/images/getstarted.png"),
              SizedBox(height: height / 11),
              Text(
                "Get started",
                style: TextStyle(
                    color: notifier.getblck,
                    fontSize: 26.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
              SizedBox(height: height / 50),
              Text(
                "You don’t have to pay a single rupee for\nopening a stocks account\nor account maintenance.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: notifier.getgrey,
                    fontSize: 13.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
              SizedBox(height: height / 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: button("Create account", notifier.getbluecolor,
                    notifier.getwihitecolor),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(
                      const Login(),
                    );
                  },
                  child: button(
                      "Login", notifier.getwihitecolor, notifier.getbluecolor)),
            ],
          ),
        ),
      ),
    );
  }
}

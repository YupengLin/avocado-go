import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/screens/Auth/Sign%20Up.dart';
import 'package:gogrow/screens/Auth/veryfiy_login.dart';
import 'package:gogrow/screens/reset_password/phone_num_reset_password.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../Custom_BlocObserver/button/custtom_button.dart';
import '../../Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import '../../Custom_BlocObserver/custtom_textfild/custtompassword.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      builder: (context, child) => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(notifier.getwihitecolor, "", notifier.getblck,
            height: height / 15),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: width / 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            color: notifier.getblck,
                            fontSize: 26.sp,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                      SizedBox(height: height / 25),
                      Text(
                        "Enter your email address and password to\nlogin",
                        style:
                            TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                      ),
                      SizedBox(height: height / 30),
                      Customtextfild.textField(
                          "Email address",
                          notifier.getbluecolor,
                          Icons.email,
                          notifier.getgrey,
                          notifier.getprefixicon,
                          notifier.getblck,
                          notifier.getgrey),
                      SizedBox(height: height / 30),
                      Custompasswordtextfild.textField(
                          "Password",
                          notifier.getbluecolor,
                          Icons.lock,
                          notifier.getgrey,
                          notifier.getprefixicon,
                          notifier.getblck),
                      SizedBox(height: height / 30),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const phone_num_reset_password(),
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 13.5.sp,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                  ),
                  SizedBox(width: width / 10),
                ],
              ),
              SizedBox(height: height / 2.7),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const veryfiylogin(),
                    ),
                  );
                },
                child: button(
                    "Login", notifier.getbluecolor, notifier.getwihitecolor),
              ),
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const SignUp());
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 15.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

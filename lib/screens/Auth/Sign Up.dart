import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avocado_go/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:avocado_go/Custom_BlocObserver/button/custtom_button.dart';
import 'package:avocado_go/Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import 'package:avocado_go/Custom_BlocObserver/notifire_clor.dart';
import 'package:avocado_go/bottom_bar/bottom_bar.dart';

import '../../Custom_BlocObserver/custtom_textfild/custtompassword.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late ColorNotifier notifier;
  bool isChecked = false;
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
                        "Sign Up",
                        style: TextStyle(
                            color: notifier.getblck,
                            fontSize: 26.sp,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                      SizedBox(height: height / 25),
                      Text(
                        "It only  takes a minute to create your\naccount",
                        style:
                            TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                      ),
                      SizedBox(height: height / 30),
                      Customtextfild.textField(
                          "Full name",
                          notifier.getbluecolor,
                          Icons.person,
                          notifier.getgrey,
                          notifier.getprefixicon,
                          notifier.getblck,
                          notifier.getgrey),
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
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.sp,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.sp),
                                ),
                              ),
                              activeColor: notifier.getbluecolor,
                              side: BorderSide(color: notifier.getbluecolor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "I agree to the GoGrow ",
                                    style: TextStyle(
                                        fontSize: height / 55,
                                        color: notifier.getblck),
                                  ),
                                  Text(
                                    "Terms of Service ",
                                    style: TextStyle(
                                        fontFamily: 'Gilroy_Medium',
                                        fontSize: height / 55,
                                        color: notifier.getbluecolor),
                                  ),
                                  Text(
                                    "and",
                                    style: TextStyle(
                                        fontFamily: 'Gilroy_Medium',
                                        fontSize: height / 55,
                                        color: notifier.getblck),
                                  ),
                                ],
                              ),
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                    fontFamily: 'Gilroy_Medium',
                                    fontSize: height / 55,
                                    color: notifier.getbluecolor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 4.5),
              GestureDetector(
                  onTap: () {
                    Get.to(bottom_Home());
                  },
                  child: button("Create account", notifier.getbluecolor,
                      notifier.getwihitecolor)),
              SizedBox(height: height / 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Don’t have an account?",
                  //   style: TextStyle(
                  //       color: notifier.getgrey,
                  //       fontSize: 15.sp,
                  //       fontFamily: 'Gilroy_Medium'),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.to(bottom_Home());
                    },
                    child: Text(
                      "Login",
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

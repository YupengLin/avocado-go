import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:gogrow/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:gogrow/Custom_BlocObserver/notifire_clor.dart';
import 'package:gogrow/screens/Payment%20Method/choice_payment.dart';
import 'package:gogrow/screens/profile/FAQ.dart';
import 'package:gogrow/screens/profile/Language.dart';
import 'package:gogrow/screens/profile/Message%20Support.dart';
import 'package:gogrow/screens/profile/My%20Account.dart';
import 'package:gogrow/screens/profile/Referral%20Code.dart';
import 'package:gogrow/screens/profile/Settings.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: () => Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
            notifier.getwihitecolor, "Profile", notifier.getblck,
            height: height / 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _profile(),
              SizedBox(height: height / 20),
              GestureDetector(
                  onTap: () {
                    Get.to(const ReferralCode());
                  },
                  child: referal_code()),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  Get.to(const choice_payment());
                },
                child: iteam_list(
                    "assets/images/BillingPayment.png", "", "Billing/Payment"),
              ),
              SizedBox(height: height / 30),
              GestureDetector(
                  onTap: () {
                    Get.to(  Language());
                  },
                  child: iteam_list(
                      "assets/images/Language.png", "English", "Language")),
              SizedBox(height: height / 30),
              GestureDetector(
                  onTap: () {
                    Get.to(const Settings());
                  },
                  child:
                      iteam_list("assets/images/Settings.png", "", "Settings")),
              SizedBox(height: height / 30),
              GestureDetector(
                  onTap: () {
                    Get.to(const FAQ());
                  },
                  child: iteam_list("assets/images/FAQ.png", "", "FAQ")),
              SizedBox(height: height / 20),
              GestureDetector(
                onTap: () {
                  Get.to(const MessageSupport());
                },
                child: support(
                    notifier.getbluecolor,
                    "We’d love to hear your feedback!\nWe are always looking to improve.",
                    notifier.getwihitecolor),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget support(colorbutton, buttontext, buttontextcolor) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {
              print(constraints);
              return Container(
                height: height / 13,
                width: width / 1.1,
                decoration: BoxDecoration(
                  color: colorbutton!,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/support.png",
                        height: height / 20),
                    Text(
                      buttontext!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 13.sp,
                          color: buttontextcolor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: notifier.getwihitecolor,
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Stack(
          children: [
            Image.asset("assets/images/profile.png", height: height / 14),
            Padding(
              padding: EdgeInsets.only(top: height / 26, left: width / 12),
              child:
                  Image.asset("assets/images/Camera.png", height: height / 30),
            ),
          ],
        ),
        SizedBox(width: width / 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sunder Pichai",
              style: TextStyle(
                  color: notifier.getblck,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy_Bold'),
            ),
            Text(
              "SunderPichai@yahoo.com",
              style: TextStyle(
                  color: notifier.getgrey,
                  fontSize: 12.sp,
                  fontFamily: 'Gilroy_Medium'),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(const MyAccount());
          },
          child: Text(
            "Edit",
            style: TextStyle(
                color: notifier.getbluecolor,
                fontFamily: 'Gilroy_Bold',
                fontSize: 15.sp),
          ),
        ),
        SizedBox(width: width / 17),
      ],
    );
  }

  Widget referal_code() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Referral Code",
                style: TextStyle(
                    color: notifier.getblck,
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
              Text(
                "Share your love and get \$10 of free stocks",
                style: TextStyle(
                    color: notifier.getgrey,
                    fontSize: 12.sp,
                    fontFamily: 'Gilroy_Medium'),
              ),
            ],
          ),
          const Spacer(),
          Image.asset("assets/images/gift.png", height: height / 30),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget iteam_list(image, txt, name) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 25),
          Image.asset(image, height: height / 15),
          SizedBox(width: width / 40),
          Text(
            name,
            style: TextStyle(
                color: notifier.getblck,
                fontSize: 15.sp,
                fontFamily: 'Gilroy_Bold'),
          ),
          const Spacer(),
          Text(
            txt,
            style: TextStyle(
                color: notifier.getgrey,
                fontFamily: 'Gilroy_Medium',
                fontSize: 12.sp),
          ),
          SizedBox(width: width / 100),
          Icon(Icons.arrow_forward_ios, color: notifier.getgrey, size: 17.sp),
          SizedBox(width: width / 15),
        ],
      ),
    );
  }
}

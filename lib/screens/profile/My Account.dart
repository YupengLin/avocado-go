import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:avocado_go/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:avocado_go/Custom_BlocObserver/button/custtom_button.dart';
import 'package:avocado_go/Custom_BlocObserver/custtom_textfild/custtompassword.dart';
import 'package:avocado_go/Custom_BlocObserver/notifire_clor.dart';

import '../../Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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

    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(
          notifier.getwihitecolor, "My Account", notifier.getblck,
          height: height / 15),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 25),
            Center(
              child: Stack(
                children: [
                  Image.asset("assets/images/profile.png", height: height / 6),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 8.9, left: width / 4.8),
                    child: Image.asset("assets/images/Camera.png",
                        height: height / 18),
                  ),
                ],
              ),
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
            SizedBox(height: height / 40),
            Customtextfild.textField(
                "Email address",
                notifier.getbluecolor,
                Icons.email,
                notifier.getgrey,
                notifier.getprefixicon,
                notifier.getblck,
                notifier.getgrey),
            SizedBox(height: height / 40),
            Custompasswordtextfild.textField(
                "Password",
                notifier.getbluecolor,
                Icons.lock,
                notifier.getgrey,
                notifier.getprefixicon,
                notifier.getblck),
            SizedBox(height: height / 40),
            Customtextfild.textField(
                "Phone number",
                notifier.getbluecolor,
                Icons.call,
                notifier.getgrey,
                notifier.getprefixicon,
                notifier.getblck,
                notifier.getgrey),
            SizedBox(height: height / 5.5),
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: button("Save Changes", notifier.getbluecolor,
                    notifier.getwihitecolor))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends PreferredSize {
  final double height;
  final String txt;
  final Color color;
  final Color titlecolor;

  CustomAppBar(
    this.color,
    this.txt,
    this.titlecolor, {
    Key? key,
    required this.height,
  }) : super(
          key: key,
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
            leading: ["Portfolio", "Order", "Profile", "Exchange"]
                    .where((element) => element == txt)
                    .isEmpty
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/images/back.png", scale: 5),
                  )
                : null,
            title: Text(
              txt == "Exchange" ? "" : txt,
              style: TextStyle(color: titlecolor, fontFamily: 'Gilroy_Bold'),
            ),
          ),
          preferredSize: Size.fromHeight(height),
        );
}

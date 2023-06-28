

    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget drewNavBar(){
  int currentTab = 0;
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    notchMargin: 35,
    child: Container(
      width: 428,
      height: 72,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            HexColor("#EE5B3E"),
            HexColor("#D8282D"),
          ]),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/heart.png"))),
                    ),
                    Text(
                      "المفضلة",
                      style: TextStyle(
                        color: currentTab == 0
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 36,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/profile-circle.png"))),
                    ),
                    Text(
                      "الحساب",
                      style: TextStyle(
                        color: currentTab == 0
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/category.png"))),
                    ),
                    Text(
                      "الاقسام",
                      style: TextStyle(
                        color: currentTab == 0
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 36,
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(
                                  "assets/image/Group 3.png"))),
                    ),
                    Text(
                      "الرئيسية",
                      style: TextStyle(
                        color: currentTab == 0
                            ? Colors.blueAccent
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );



}
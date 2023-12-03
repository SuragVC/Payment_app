import 'dart:math';

import 'package:flutter/material.dart';
import 'package:payment_app/const/app_colors.dart';
import 'package:payment_app/pages/payment_page.dart';
import 'package:payment_app/widgets/app_buttons.dart';
import 'package:payment_app/widgets/app_large_button.dart';
import 'package:payment_app/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 250,
      child: Stack(children: [
        _mainBackground(),
        _curveImageContainer(),
        _buttonContainer(),
        _textContainerShadow(),
        _textContainer(),
      ]),
    );
  }

  _mainBackground() {
    return Positioned(
        child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background.png"),
        ),
      ),
    ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -10,
        bottom: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/curve.png"),
            ),
          ),
        ));
  }

  _buttonContainer() {
    return Positioned(
      bottom: 10,
      right: 50,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext ctx) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 180,
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: const Color(0xFFeef1f4).withOpacity(0.7),
                        height: MediaQuery.of(context).size.height - 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 50,
                      child: Container(
                        width: 55,
                        height: 250,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Column(
                          children: [
                            AppButtons(
                              fontSize: 10,
                              icon: Icons.cancel,
                              iconColor: AppColors.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppButtons(
                              fontSize: 10,
                              icon: Icons.add,
                              iconColor: AppColors.mainColor,
                              text: "Add Bill",
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            AppButtons(
                              fontSize: 10,
                              icon: Icons.history,
                              text: "History",
                              iconColor: AppColors.mainColor,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              iconSize: 34,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                );
              });
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/lines.png")),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.2))
              ]),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
      top: 250,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              height: 130,
              width: MediaQuery.of(context).size.width - 50,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFd8dbe0),
                      offset: Offset(1, 1),
                      blurRadius: 20.8,
                      spreadRadius: 10)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 18, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 5, color: Colors.red),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/brand1.png"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "ID : 785668",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.idColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedText(
                            text: "Auto Pay on 24th May 18",
                            color: AppColors.green)
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 20),
                                width: 80,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: AppColors.selectBackground,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.selectColor),
                                  ),
                                )),
                            Expanded(child: Container()),
                            const Text(
                              "\$1412.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: AppColors.mainColor),
                            ),
                            Text(
                              "Due in 3 Days",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.idColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _payButton() {
    return Positioned(
      bottom: 10,
      child: AppLargeButton(
        text: "Pay All Bills",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentPage()),
          );
        },
      ),
    );
  }

  _textContainer() {
    return const Positioned(
      left: 20,
      top: 80,
      child: Text(
        "My Bills",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  _textContainerShadow() {
    return Positioned(
      left: 0,
      top: 120,
      child: Transform.rotate(
        angle: pi,
        child: Text(
          "My Bills",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF293952).withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

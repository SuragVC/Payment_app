import 'package:flutter/material.dart';
import 'package:payment_app/const/app_colors.dart';
import 'package:payment_app/widgets/app_buttons.dart';
import 'package:payment_app/widgets/app_large_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/paymentbackground.png"),
          ),
        ),
        child: Column(
          children: [
            _successImage(h),
            _successText(),
            SizedBox(
              height: h * 0.045,
            ),
            _paymentCompletedList(),
            SizedBox(
              height: h * 0.045,
            ),
            _totalAmount(),
            SizedBox(
              height: h * 0.10,
            ),
            _iconButtons(),
            SizedBox(
              height: h * 0.02,
            ),
            AppLargeButton(
              text: "Done",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  _successImage(double h) {
    return SizedBox(
      width: double.maxFinite,
      height: h * 0.14,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/images/success.png"),
          ),
        ),
      ),
    );
  }

  _successText() {
    return SizedBox(
      child: Column(children: [
        Text(
          "Success !",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF293952).withOpacity(0.8),
          ),
        ),
        const Text(
          "Payment is completed for 2 bills",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.idColor,
          ),
        ),
      ]),
    );
  }

  _paymentCompletedList() {
    return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green),
                      child: const Icon(
                        Icons.done,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "KenGen Power",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Text(
                          "ID: 2384787",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.idColor,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text(
                        '\$1523',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                const Divider()
              ],
            );
          },
        ),
      ),
    );
  }

  _totalAmount() {
    return const SizedBox(
      child: Column(children: [
        Text(
          "Total Amount",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.idColor,
          ),
        ),
        Text(
          "\$3056.00",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor,
          ),
        ),
      ]),
    );
  }

  _iconButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButtons(
          icon: Icons.share_sharp,
          textColor: AppColors.mainColor,
          onTap: () {},
          text: "Share",
          iconSize: 20,
          fontSize: 15,
          iconColor: Colors.white,
        ),
        const SizedBox(
          width: 60,
        ),
        AppButtons(
            icon: Icons.print,
            textColor: AppColors.mainColor,
            onTap: () {},
            text: "Print",
            fontSize: 15,
            iconSize: 20,
            iconColor: Colors.white),
      ],
    );
  }
}

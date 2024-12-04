import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Account/ResetPin.dart';
import 'package:flutter_app/CreditDebitCardAddCard.dart';
import 'package:flutter_app/CreditDebitCardAvailableCard.dart';
import 'package:flutter_app/CreditDebitCardViewCard.dart';
import 'package:flutter_app/CreditDebitNoCard.dart';
import 'package:flutter_app/EditProfile.dart';
import 'package:flutter_app/FAQ.dart';
import 'package:flutter_svg/svg.dart';

import '../BlogAndAticles.dart';
import 'CreditDebitCard.dart';
import '../CustomerCareOption.dart';
import '../Main/Dashboard.dart';
import 'DeviceOrder.dart';
import 'DeviceOwned.dart';
import '../FundWallet.dart';
import '../HealthStatistic.dart';
import '../HowItWorks.dart';
import '../PersonalHistoryRecords.dart';
import '../PinSettings.dart';
import 'Referral/Referrals.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({super.key});

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  List<dynamic> randomCreditCardMock = [CreditDebitNoCard(), CreditDebitCardAvailableCard()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            backgroundColor: const Color(0xffF2F2F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: getFontSize(250, context),
                  width: double.infinity,
                      decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'Account',
                        style: TextStyle(
                              fontSize: getFontSize(29, context),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E2E42),
                        ),
                      ),
                          SizedBox(height: getFontSize(10, context),),
                      Container(
                            height: getFontSize(117, context),
                        width: double.infinity,
                            padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                                color: const Color(0x0D000000),
                          ),
                        ),
                        child: Row(
                          children: [
                            // ClipOval for round image
                            ClipOval(
                              child: Image.asset(
                                'assets/images/rema.png',
                                    height: getFontSize(60, context),
                                    width: getFontSize(60, context),
                                fit: BoxFit.cover,
                              ),
                            ),
                                const SizedBox(width: 16),
                                Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Sanni Muiz . ',
                                      style: TextStyle(
                                            fontSize: getFontSize(22, context),
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2E2E42), // Text color
                                      ),
                                    ),
                                    Text(
                                      "Doctor",
                                      style: TextStyle(
                                          color: Colors.black12, fontSize: getFontSize(17, context)),
                                    )
                                  ],
                                ),

                                SizedBox(height: 8),
                                // Spacing between the two texts
                                Text(
                                  'johndoe@gmail.com', // Email text
                                  style: TextStyle(
                                        fontSize: getFontSize(14, context),
                                    color: Colors
                                        .blue, // Blue color for the email text
                                  ),
                                ),
                              ],
                            ),
                                const Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                alignment: Alignment.topRight,
                                width: 27,
                                height: 27,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue, // Blue background
                                ),
                                child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfile(),
                                          ),
                                        );
                                      },
                                      child:  Center(
                                  child: Icon(
                                    Icons.edit, // Write (edit) icon
                                    color: Colors.white, // White icon color
                                        size: getFontSize(16, context), // Adjust the size as needed
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                          const SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: const Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: 345,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    details(
                        icon: Icons.person,
                        detailType: "Name",
                        detailInfo: "Sanni Muiz Dolapo",
                        shouldLine: true),
                    details(
                        icon: Icons.phone,
                        detailType: "Phone Number",
                        detailInfo: "081112223344",
                        shouldLine: true),
                    details(
                        icon: Icons.email,
                        detailType: "Email Address",
                        detailInfo: "johndoe@gmail.com",
                        shouldLine: true),
                    details(
                        icon: Icons.male,
                        detailType: "Email Address",
                        detailInfo: "johndoe@gmail.com",
                        shouldLine: true),
                  ])),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: const Text(
                  'Referrals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                    padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Referrals(),
                      ),
                    );
                  },
                  child: detailsNoCol(
                      icon: Icons.link,
                      detailInfo: "Refer someone",
                      shouldLine: false),
                ),
              ),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: const Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                    padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreditDebitCard())),
                      child: detailsNoCol(
                          icon: Icons.wallet_outlined,
                          detailInfo: "Wallet",
                          shouldLine: true),
                    ),
                        const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  randomCreditCardMock[Random.secure().nextInt(2)])),
                      child: detailsNoCol(
                          icon: Icons.credit_card,
                          detailInfo: "Credit/Debit Cards ",
                          shouldLine: true),
                    ),
                        const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ResetPin())),
                      child: detailsNoCol(
                          icon: Icons.lock,
                          detailInfo: "PIN settings",
                          shouldLine: false),
                    )
                  ],
                ),
              ),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child:
                    const Text(
                  'Health history',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   PersonalHistoryRecords())),
                      child: detailsNoCol(
                          icon: Icons.person,
                          detailInfo: "Personal history records",
                          shouldLine: true),
                    ),
                            const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HealthStatistic())),
                      child: detailsNoCol(
                          icon: Icons.network_cell,
                          detailInfo: "Health statistics (in-app)",
                          shouldLine: false),
                    )
                  ])),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child:
                    const Text(
                  'Device',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DeviceOwned())),
                      child: detailsNoCol(
                          icon: Icons.person,
                          detailInfo: "Devices owned",
                          shouldLine: true),
                    ),
                            const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  DeviceOrder())),
                      child: detailsNoCol(
                          icon: Icons.receipt_long_outlined,
                          detailInfo: "Device Orders",
                          shouldLine: false),
                    )
                  ])),
              Container(
                    padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child:
                    const Text(
                  'Help and support',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                      padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   CustomerCareOption())),
                      child: detailsNoCol(
                          icon: Icons.headset_mic_outlined,
                          detailInfo: "Customer care",
                          shouldLine: true),
                    ),
                            const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  FAQ())),
                      child: detailsNoCol(
                          icon: Icons.question_mark,
                          detailInfo: "FAQs",
                          shouldLine: true),
                    ),
                            const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  BlogAndAticles())),
                      child: detailsNoCol(
                          icon: Icons.receipt,
                          detailInfo: "Blogs & articles",
                          shouldLine: true),
                    ),
                            const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HowItWorks())),
                      child: detailsNoCol(
                          icon: Icons.search,
                          detailInfo: "How it works",
                          shouldLine: false),
                    ),
                  ])),
              const SizedBox(
                height: 20,
              ),

                  const SizedBox(height: 20,),

              Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                height: 90,
                width: double.infinity,
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: detailsNoCol(
                    icon: Icons.exit_to_app,
                    detailInfo: "Logout",
                    shouldLine: false,
                    lol: "true"),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )));
    }

  details(
      {required IconData icon,
      required String detailType,
      required String detailInfo,
      required bool shouldLine}) {
    return Column(children: [
      Row(
        children: [
          Container(
              width: 41,
              height: 41,
              decoration: const BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon, size: 28, color: Colors.blue),
              )),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailType,
                style: const TextStyle(color: Colors.grey, fontSize: 14),),
              const SizedBox(height: 10,),
              Text(detailInfo,
                  style: const TextStyle(color: Colors.black, fontSize: 18))
            ],
          )
        ],
      ),
      const SizedBox(height: 10),
      SvgPicture.asset(shouldLine == true ? "assets/images/line.svg" : ""),
      const SizedBox(height: 15),
    ]);
  }

  detailsNoCol(
      {required IconData icon,
      required String detailInfo,
      required bool shouldLine,
      lol}) {
    return Column(children: [
      Row(
        children: [
          Container(
              width: 41,
              height: 41,
              decoration: BoxDecoration(
                color: lol == null
                    ? const Color(0xffE2EDFF)
                    : Colors.red.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon,
                    size: 28, color: lol == null ? Colors.blue : Colors.red),
              )),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detailInfo,
                  style: TextStyle(
                      color: lol == null ? Colors.black : Colors.red,
                      fontSize: 18,
                      fontWeight:
                          lol == null ? FontWeight.normal : FontWeight.bold))
            ],
          )
        ],
      ),
      const SizedBox(height: 10),
      SvgPicture.asset(shouldLine == true ? "assets/images/line.svg" : ""),
    ]);
  }
}

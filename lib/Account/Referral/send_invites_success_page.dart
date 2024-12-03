import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/MainManvigator.dart';
import 'package:flutter_svg/svg.dart';

import 'SendInvites.dart';
import 'contacts_checked_tile.dart';
import 'my_blue_button.dart';

class SendInvitesSuccessPage extends StatelessWidget {
  const SendInvitesSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xFFE5E5E5),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back.svg',
                        width: 8.0,
                        height: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Center(
                    child: Text(
                      "Success",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const SizedBox(
                width: 260,
                height: 71,
                child: Text(
                  textAlign: TextAlign.center,
                  "You have successfully sent invitation links, when they sign up, you get a commission.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainNavigator()));
              }, child:  MyBlueButton(text: "Done")),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

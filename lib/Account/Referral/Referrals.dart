import 'package:flutter/material.dart';
import 'package:flutter_app/Account/Referral/ReferDoctor.dart';
import 'package:flutter_app/Account/Referral/ReferHospital.dart';
import 'package:flutter_app/Account/Referral/ReferPharmacy.dart';
import 'package:flutter_svg/svg.dart';

import 'ReferSomeone.dart';


void main(){
  runApp(const Referrals());
}

class Referrals extends StatefulWidget {
  const Referrals({super.key});
  @override
  _ReferralsScreen createState() => _ReferralsScreen();
}

class _ReferralsScreen extends  State<Referrals> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFE5E5E5),
                    ),
                    child: SvgPicture.asset('assets/images/back.svg',
                      width: 8.0,
                      height: 15,),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child:
                    const Center(child: Text(
                      'Referrals',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                    ),
                  ),
                  const Spacer(),

                ],
              ),
              centerTitle: true,
            ),
            body:
            Container(
                padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child:
                Align(
                    child:
                    Column(
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.68,
                            child:
                            const Align(child: Text("Invite your friends and earn commissions when they buy devices.", textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            ),),
                          const SizedBox(height: 60,),
                          SvgPicture.asset('assets/images/pana.svg'),
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.center,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferSomeone()));
                            },
                                  child:
                                referOption(
                                    icon: const Icon(Icons.person, color: Colors.blue,size: 36,),
                                    referText: "Refer a regular person"
                                ),
                                ),
                                const SizedBox(width: 25),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferHospital()));
                                  },
                                  child:
                                referOption(
                                  icon: "assets/images/hospital.svg",
                                  referText: "Refer a Hospital",
                                ),
                                ),
                              ],),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children:  [

                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferDoctor()));
                                },
                                child:
                              referOption(
                                  icon: "assets/images/rad.svg",
                                  referText: "Refer a Doctor"
                              ),
                              ),
                              const SizedBox(width: 25),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ReferPharmacy()));
                                },
                                child:
                              referOption(
                                  icon: "assets/images/rap.svg",
                                  referText: "Refer a Pharmacy"
                              ),
                              ),
                            ],)
                        ]

                    ))
            ));
  }

  referOption({
    icon,
    required String referText
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          width: 86,
          height: 86,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffE2EDFF)
          ),
          child: icon is Icon ? icon : SvgPicture.asset(icon, width: 26, height: 26,),
        ),
        const SizedBox(height: 15,),
        Text(referText, style: const TextStyle(
            fontSize: 14
        ),)
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ChangeLocation.dart';

class Selectpickuplocation extends StatefulWidget {
  const Selectpickuplocation({super.key});

  @override
  State<Selectpickuplocation> createState() => _SelectpickuplocationState();
}

class _SelectpickuplocationState extends State<Selectpickuplocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Select pickup location',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
        padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        Text("Your Location", style: TextStyle(fontSize: 18),),
        SizedBox(height: 20,),
        Row(
          children: [
            Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Region",style: TextStyle(fontSize: 16,color: Colors.black38) ),
                Text("Lagos", style: TextStyle(fontSize: 16))
              ],
            )
          ],
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LGA",style: TextStyle(fontSize: 16,color: Colors.black38) ),
                Text("Agege, Lagos", style: TextStyle(fontSize: 16))
              ],
            )
          ],
        ),
          ],
        ),
        SizedBox(height: 15,),
        ElevatedButton(
          onPressed: () {
            // TODO the popup nd select location no dey so redo it
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            side: BorderSide(
              color: Colors.blue,
              width: 2.0,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Change Location',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 25,),
        Text("Pickup venues near you", style: TextStyle(fontSize: 16)),
        SizedBox(height: 25,),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffF9F9F9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Landmark hospitals", style: TextStyle(fontSize: 16)),
              SizedBox(height: 9,),
              Text("50, Saint Mark Avenue, off Raymond estate, Surulere, Lagos", style: TextStyle(color: Colors.black45)),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  // TODO the popup nd select location no dey so redo it
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                ),
                child: Align(alignment: Alignment.center, child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                    'Change Location',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                   SizedBox(width: 10,),
                   Icon(Icons.check_circle, color: Colors.white,),
                      Spacer(),
                    ]
                  )
                ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            // TODO the popup nd select location no dey so redo it
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ChangeLocation()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),

          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    )
    )
    );
  }
}

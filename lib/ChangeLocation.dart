import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Checkout.dart';
import 'package:flutter_svg/svg.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

      inputField(label: "State",
          hint: "e.g lagos"),
      inputField(label: "Region",
          hint: "e.g surulere"),
      ElevatedButton(
        onPressed: () {
          // TODO the popup nd select location no dey so redo it
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Checkout()));
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
            'Confirm new location',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      ]
    )
    )
    );
  }
  inputField({
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16),),
        const SizedBox(height: 10,),

        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.grey[200], // Light gray background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Circular border radius
              borderSide: BorderSide(
                color: Colors.grey.shade300, // Light gray border
                width: 1, // Border thickness
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            suffixIcon:  Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.black45,
            ),// Optional suffix icon
            constraints: const BoxConstraints(
              maxWidth: 331, // Set the fixed width for the TextField
            ),
          ),
        ),

        const SizedBox(height: 15,), // Additional vertical space between fields
      ],
    );
  }
}

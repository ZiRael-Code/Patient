import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/RequestNewDeviceLoan.dart';
import 'package:flutter_svg/svg.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({super.key});

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  bool _isSwitched = false;
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
        padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
    child:
    Align(
    child:
    Column(
    children: [
      SizedBox(height: 50,),
      Text("Loan details", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Container(
          width: 256,
          child:
          Text(style: TextStyle(fontSize: 14)
              ,textAlign: TextAlign.center,"You can easily apply for a short loan if you currently don’t have enough money to buy a device.")
      ),
      SizedBox(height: 25,),
      inputField(label: "Payback date",
          hint: "3 month "),
      Row(
        children: [
          Text("Set a custom date", style: TextStyle(fontSize: 16, color: Colors.black45),),
          Spacer(),
          Switch(
            activeColor: Colors.blue,
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
          )
        ],
      ),
      Spacer(),
      Row(
        children: [
          GestureDetector(
            child:
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isCheck ?  Colors.blue : Colors.grey.withOpacity(0.40),
            ),
            child: Icon(Icons.check, color: Colors.white,)
          ),
            onTap: (){
              setState(() {
                _isCheck =!_isCheck;
              });
            },
          ),
          SizedBox(width: 7,),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            child: Text(maxLines: 2,"By clicking on the checkbox, you are agreeing to our loan terms and conditions."
          )
          )
          ],
      ),
      SizedBox(height: 20,),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => RequestNewDeviceLoan()));
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
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),

    ]
    )
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

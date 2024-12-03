import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/OnBoarding/SetNewPin.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(EnableFingerprint());
}

class EnableFingerprint extends StatefulWidget{
  EnableFingerprintState createState() => EnableFingerprintState();
}

class EnableFingerprintState extends State<EnableFingerprint>{
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
  bool showButton = false;
  @override
  void initState() {
    // TODO: implement initState
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          showButton = true;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(
           padding: EdgeInsets.only(top: 80, bottom: 40, left: 20, right: 20),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Align(
            alignment: Alignment.topCenter,
             child: SvgPicture.asset('assets/images/slide.svg'),
           ),
           SizedBox(height: 20,),
           Text('Enable fingerprint', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
           SizedBox(height: 15,),
          Container(
            width: 176,
            child: Text(textAlign: TextAlign.center,'Tap on the icon to enable your fingerprint.'),

          ),

           Spacer(),

            showButton ? SvgPicture.asset('assets/images/markedfingerprint.svg')
                       : SvgPicture.asset('assets/images/fingerprint.svg'),
           Spacer(),
           showButton ? ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SetNewPin()));
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
           ): SizedBox()
         ],
       ),
       ),
   );
  }

  input_field({
    required String label,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: '*********',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          )
        ],
      ),
    );
  }
}
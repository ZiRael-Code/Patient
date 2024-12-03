import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/OnBoarding/SetNewPassword.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const Signup());
}

class Signup extends StatelessWidget{
  const Signup({super.key});

  Widget build (BuildContext context) {
    return  Scaffold(
        body: SignupState(),
    );
  }
}
void _handleGoogleLogin() {

  print("Google icon clicked");
}

Future<void> _handleRegister(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userStr = "false";
  await prefs.setString("user", userStr);
  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SetNewPassword()));
  print("Google icon clicked");
}

void handleFacebook(){
  print("hello clicker");
}

class SignupState extends StatefulWidget {
  @override
  _SignupStateState createState() => _SignupStateState();
}

class _SignupStateState extends State<SignupState> {
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50.0),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          const Align(
            alignment: Alignment.topLeft,
          child: Text(
            'First Name',
            style: TextStyle(fontSize: 16),
          ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'First Name',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Last Name',
            style: TextStyle(fontSize: 16),
          ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Last Name',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Phone Number',
            style: TextStyle(fontSize: 16),
          ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Email Address',
            style: TextStyle(fontSize: 16),
          ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email Address',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Align(
            alignment: Alignment.topLeft,
          child: Text(
            'Referral Code',
            style: TextStyle(fontSize: 16),
          ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Referral Code',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _handleRegister(context);
                // Handle login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3C8AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
      const SizedBox(height: 20.0),
      const Text(
        'Or signup with',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onDoubleTap:_handleGoogleLogin,
            child: SvgPicture.asset(
              "./assets/images/facebook.svg",
              // onPressed: () {
              //   // Handle Facebook login
              // },
            ),
            ),

      //     ),
          const SizedBox(width: 20.0),
          GestureDetector(
            onDoubleTap: _handleGoogleLogin,
            child: SvgPicture.asset(
                "./assets/images/goggle.svg"
            ),
          ),
        ],
      ),
      const SizedBox(height: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: const Text(
              'Login Here',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C8AFF),
              ),
            ),
          ),
        ],
      ),
    ],
    ),
    );
  }
}


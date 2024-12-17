import '../Main/Dashboard.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainManvigator.dart';
import 'Main/Dashboard.dart';
import 'Signup.dart';



void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: LoginState(),
    );
  }
}
void _handleGoogleLogin() {

  print("Google icon clicked");
}

Future<void> _handleLogin(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userStr = prefs.getString('user');
  if (userStr == null) {
    userStr = "true";
    prefs.setString('user', userStr);
  }else{
    userStr = "true";
     prefs.setString('user', userStr);
  }
}

void _handleFacebookLogin() {

  print("Facebook icon clicked");
}

class LoginState extends StatefulWidget {
  @override
  _LoginStateState createState() => _LoginStateState();
}

class _LoginStateState extends State<LoginState> {
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: getFontSize(50.0, context)),
            child: SvgPicture.asset(
              'assets/images/illustration.svg',

              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: getFontSize(32, context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
           Align(
    alignment: Alignment.centerLeft,
            child: Text(
              'Username',
              style: TextStyle(
                fontSize: getFontSize(16, context),
              ),
            ),
          ),
          SizedBox(height: getFontSize(8.0, context)),
          TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color(0xFFf0f0f0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: getFontSize(20.0, context)),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: getFontSize(16, context),
              ),
            ),
          ),
           SizedBox(height: getFontSize(8.0, context)),
          TextField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey),
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
          ),
          SizedBox(height: getFontSize(10.0, context)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {

              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Color(0xFF3C8AFF),
                ),
              ),
            ),
          ),
           SizedBox(height: getFontSize(20.0, context)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _handleLogin(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> MainNavigator(index: 0,)));

                // Handle login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C8AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getFontSize(16, context),
                ),
              ),
            ),
          ),
           SizedBox(height: getFontSize(20.0, context)),
          Text(
            'Or login with',
            style: TextStyle(
              fontSize: getFontSize(16, context),
              color: Colors.black,
            ),
          ),
           SizedBox(height: getFontSize(10.0, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            GestureDetector(
            onDoubleTap: _handleFacebookLogin,
              child: SvgPicture.asset(
                "./assets/images/facebook.svg",
                // onPressed: () {
                //   // Handle Facebook login
                // },
              ),
    ),
               SizedBox(width: getFontSize(20.0, context)),
              GestureDetector(
                onDoubleTap: _handleFacebookLogin,
              child: SvgPicture.asset(
                "./assets/images/goggle.svg"
              ),
              ),
            ],
          ),
          SizedBox(height: getFontSize(20.0, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Text(
                'Don\'t have an account yet?',
                style: TextStyle(
                  fontSize: getFontSize(16, context),
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child:  Text(
                  'Register now',
                  style: TextStyle(
                    fontSize: getFontSize(16, context),
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
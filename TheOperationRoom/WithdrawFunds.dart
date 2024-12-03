import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(WithdrawFunds());
}

class WithdrawFunds extends StatefulWidget {
  const WithdrawFunds({super.key});

  @override
  _WithdrawFundsScreen createState() => _WithdrawFundsScreen();
}

class _WithdrawFundsScreen extends State<WithdrawFunds> {
  String? _selectedValue;
  bool isSelected = false;
  String pin = "";
  List<int> _enteredPin = [];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                    child: SvgPicture.asset(
                      'assets/images/back.svg',
                      width: 8.0,
                      height: 15,
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Withdraw funds',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child: Align(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Align(
                          child: Text(
                            "Select any of the accounts to withdraw your funds into",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      account(
                          accountNo: "Account 1",
                          accountNumber: "0123456789",
                          bankName: "GTBank"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xFFE2EDFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _showPinScreen(context); // Show PIN screen when confirm is clicked

                          },
                          child: Text(
                            'Add another account',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: double.infinity,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xFF3C8AFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _showPinScreen(context); // Show PIN screen when confirm is clicked
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  account(
      {required String accountNo,
        required String accountNumber,
        required String bankName}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accountNo,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          accountNumber,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          bankName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: isSelected
                            ? Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SvgPicture.asset("assets/images/line.svg"),
      ],
    );
  }

  // Function to show the sliding pin entry screen
  void _showPinScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Enter PIN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 163,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < _enteredPin.length
                            ? Colors.black
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              _buildNumberPad(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNumberPad() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return SizedBox.shrink();
          } else if (index == 11) {
            return IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                setState(() {
                  if (_enteredPin.isNotEmpty) _enteredPin.removeLast();
                });
              },
            );
          }
          int number = index == 10 ? 0 : index + 1;
          return GestureDetector(
            onTap: () {
              if (_enteredPin.length < 4) {
                setState(() {
                  _enteredPin.add(number);
                });
              }
            },
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(EditProfile());
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends  State<EditProfile> {
  String? _selectedValue;

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
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Edit Profile',
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
        body: SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(15),
        child: Column(
          children: [

            Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/rema.png',
                height: 123,
                width: 123,
                fit: BoxFit.cover,
              ),
            ),
            ),

            textField(
              fieldType: 'First Name',
              fieldHint: 'First Name',
            ),
            textField(
              fieldType: 'Last Name',
              fieldHint: 'Last Name',
            ),
            textField(
              fieldType: 'Specialization',
              fieldHint: 'Specialization',
            ),
            textField(
              fieldType: 'Email Address',
              fieldHint: 'Email Address',
            ),


            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Gender",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                color: Color(0xFFf0f0f0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: DropdownButton<String>(
                value: _selectedValue,
                hint: Text("Gender", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:  Colors.grey,
                ),
                icon: Icon(Icons.keyboard_arrow_down),
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>['Male', 'Female', '02:00 PM', '04:00 PM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
SizedBox(height: 15,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Certificate",
                style: TextStyle(fontSize: 16),
              ),
            ),
        SizedBox(height: 8,),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
            color: Color(0xFFf0f0f0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Text("Bsc.", style: TextStyle(
                color: Colors.grey
              ),),
              Spacer(),
              Icon(Icons.edit, color: Colors.black,)
            ],
          ),
        ),
SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {},
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
                  'Save changes',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

          ],
        )
        ),
        ),
      ));
  }

  textField({
    required String fieldType,
    required String fieldHint}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            fieldType,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            hintText: fieldHint,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color(0xFFf0f0f0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
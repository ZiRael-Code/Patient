import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DoYouHaveDevice.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(SelectCondition());
}

class SelectCondition extends StatefulWidget{
  @override
  _SelectCondition createState() => _SelectCondition();
}

class  _SelectCondition extends State<SelectCondition>{
  List<bool> selectedList = [];

  @override
  void initState() {
    super.initState();
    selectedList = List.generate(16, (index) => false);  // Fills the list with 10 false values
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(padding:
       EdgeInsets.only(top: 45, bottom: 30),
       child: Column(
         children: [
         Align(
         alignment: Alignment.centerRight,
         child: Container(
           padding: EdgeInsets.only(left: 18, right: 18),
           child: Text('skip', style: TextStyle(color: Colors.blue, fontSize: 16)),
         ),
         ),
           SizedBox(height: 45,),

           Container(
             width: 264,
             child: Text(textAlign: TextAlign.center,'Which of the following condition(s) do you want to manage?',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
           ),
           SizedBox(height: 15,),
           Container(
             width: 284,
             child: Text(textAlign: TextAlign.center,'We need this information so we can tailor the experience to you and help you recommend services that will be useful to you.',style: TextStyle(fontSize: 14,),),
           ),
           SizedBox(height: 35,),
          Wrap(
            children: [
              condition(
                index: 0,
                text: "Blood pressure"
              ),
              condition(
                  index: 1,
                text: "Blood glucose"
              ),
              condition(
                  index: 2,
                text: "HbA1c"
              ),
              condition(
                  index: 3,
                text: "Stress level (HRV)"
              ),
              condition(
                  index: 4,
                text: "Heart rhythm"
              ),
              condition(
                  index: 5,
                text: "Uric Acid"
              ),
              condition(
                  index: 6,
                text: "Haemoglobin"
              ),
              condition(
                  index: 7,
                text: "Oxygen saturation"
              ),
              condition(
                  index: 8,
                text: "Respiration"
              ),
              condition(
                  index: 9,
                text: "Cholesterol & Lipids"
              ),
              condition(
                  index: 10,
                text: "ECG"
              ),
              condition(
                  index: 11,
                text: "Body temperature"
              ),

         Container(
           padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
           margin: EdgeInsets.only(right: 8, bottom: 12),
           decoration: BoxDecoration(
             border: Border.all(width: 1,
               color: Colors.blue,
           ),
               borderRadius: BorderRadius.circular(50)
           ),
           child:
           Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               Icon(Icons.add, color: Colors.blue,),
               Text('Add new', style: TextStyle(color: Colors.blue),),

             ],
           )
         )

            ],
          ),
           Spacer(),
           Container(
             padding: EdgeInsets.only(left: 10, right: 10),
             child:

             ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> DoYouHaveDevice()));
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
           ),
         ],
       ),
       ),
   );
  }

  condition({
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedList[index] = !selectedList[index];
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        margin: EdgeInsets.only(right: 8, bottom: 16),
        decoration: BoxDecoration(
          color: selectedList[index] ? Colors.blue : Color(0xffE2EDFF),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedList[index] ? Colors.white : Colors.blue,
          ),
        ),
      ),
    );
  }

}
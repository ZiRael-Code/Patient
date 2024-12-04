import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(FAQ());
}

class FAQ extends StatefulWidget {
  const FAQ({super.key});
  @override
  _FAQScreen createState() => _FAQScreen();
}

class _FAQScreen extends State<FAQ> {
  List<bool> _isExpandedList = List.generate(50000, (index) => false);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: const Center(
                    child: Text(
                      'FAQ’s',
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  faqWidget(
                      question:
                      "This is another example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 0),
                  faqWidget(
                      question:
                      "This is a third example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 1),
                  faqWidget(
                      question:
                      "This is a fourth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 2),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                  faqWidget(
                      question:
                      "This is a fifth example of a frequently asked ...",
                      ans:
                      "The answer to this question is decided by the physician. Or it's something we can easily include a link. The link takes us to one of the pages.",
                      index: 3),
                ],
              ),
            ),

        ));
  }

  // Pass the index of the FAQ so each has its own expand/collapse state
  Widget faqWidget({
    required String question,
    required String ans,
    required int index,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 266,
                  child: Expanded(
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: _isExpandedList[index] ? null : 1,
                      overflow: _isExpandedList[index]
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpandedList[index] = !_isExpandedList[index];
                    });
                  },
                  child: Icon(
                    _isExpandedList[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down_sharp,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            if (_isExpandedList[index]) ...[
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 226,
                  child: Text(
                    ans,
                    style: TextStyle(fontSize: 12, color: Color(0xff2C2C2C)),
                  ),
                ),
              ),
            ],
            SizedBox(height: 20),
            SvgPicture.asset("assets/images/line.svg")
          ],
        ),
      ),
    );
  }
}

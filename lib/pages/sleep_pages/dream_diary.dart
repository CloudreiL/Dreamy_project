import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dreamy_project/classes/style.dart';

class DreamDiary extends StatefulWidget{
  const DreamDiary({super.key});

  @override
  _DreamDiaryState createState() => _DreamDiaryState();

}

class _DreamDiaryState extends State<DreamDiary>{

  List<String> choice = ["date", "emotions"];
  bool dropdownMenu0 = false;
  String? dropdownValue0;

  final count = 2;

  @override
  Widget build(BuildContext context){

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromRGBO(57, 34, 99, 1)],
            )
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text('Dream Diary', style: TextStyles.StyleText.copyWith(
                fontSize: 30,
              )),
              backgroundColor: Colors.transparent
          ),
          body: SingleChildScrollView(
            child: Scrollbar(
              thumbVisibility: true,
              child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            "Sort by",
                            style: TextStyles.StyleText,
                          ),
                        ),
                        Container(
                          width: 160,
                          decoration: ContainerDecor.DownMenuBox,
                          child: DropdownMenu(
                            width: 160,
                            dropdownMenuEntries: choice
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                            textStyle: TextStyles.StyleText.copyWith(
                                color: Colors.white, fontSize: 17),
                            textAlign: TextAlign.center,
                            trailingIcon: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
                            selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,),
                            inputDecorationTheme: DropDownMenuDec.MenuDec,
                            initialSelection: dropdownValue0,
                            onSelected: (String? newValue0) {
                              setState(() {
                                dropdownValue0 = newValue0;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        )
    );
  }
}

import 'package:flutter/material.dart';
import'package:dreamy_project/localStorage/data.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:intl/intl.dart';

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
            title: Text('Your Dream Diary', style: TextStyles.StyleText.copyWith(
              fontSize: 30,
            )),
            backgroundColor: Colors.transparent,

          ),
          body: Stack(
            children: [
              Column(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Expanded(
                      child: GridView.builder(
                        itemCount: notes.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: MediaQuery.of(context).size.width * 0.0020,
                            crossAxisSpacing: MediaQuery.of(context).size.width * 0.07,
                            mainAxisSpacing: 6),
                        itemBuilder: (context, index){
                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  decoration: ContainerDecor.ContainerDec.copyWith(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(103, 58, 183, 1),
                                        Color.fromRGBO(195, 66, 218, 1)
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children:[
                                            Padding(
                                              padding: const EdgeInsets.only(left: 3.0, top: 3),
                                              child: Text(notes[index].title, style: TextStyles.StyleText),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 3.0, top: 3),
                                              child: notes[index].icon,
                                            )
                                          ]
                                      ),
                                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3.0),
                                        child: Text(notes[index].content, style: TextStyles.StyleText.copyWith(fontSize: 15),
                                            overflow: TextOverflow.ellipsis, maxLines: 6),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                                          Padding(
                                            padding: const EdgeInsets.only(right:3.0),
                                            child: Text(DateFormat('yyyy-MM-dd').format(notes[index].date),
                                                style: TextStyles.StyleText.copyWith(fontSize: 15)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ]),
            ],
          ),
        )
    );
  }
}

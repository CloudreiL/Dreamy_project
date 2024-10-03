import 'package:dreamy_project/classes/style.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;

  List<String> time0 = ["9PM", "10PM", "11PM", "12PM"];
  List<String> time1 = ["6AM", "7AM", "8AM", "9AM"];
  String? dropdownValue0;
  String? dropdownValue1;
  bool dropDownMenu0 = false;
  bool dropDownMenu1 = false;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color.fromRGBO(57, 34, 99, 1)],
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text('Notifications',
                style: TextStyles.StyleText.copyWith(fontSize: 30)),
            backgroundColor: Colors.transparent),
        body: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.all(20),
                height: 50,
                decoration: ContainerDecor.ContainerDec.copyWith(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Bedtime notifications',
                        style: TextStyles.StyleText,
                      ),
                    ),
                    Switch(
                      activeColor: Colors.white,
                      value: light0,
                      onChanged: (bool value) {
                        setState(() {
                          light0 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                height: 50,
                decoration: ContainerDecor.ContainerDec.copyWith(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Morning notifications',
                        style: TextStyles.StyleText,
                      ),
                    ),
                    Switch(
                      activeColor: Colors.white,
                      value: light1,
                      onChanged: (bool value) {
                        setState(() {
                          light1 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                height: 50,
                decoration: ContainerDecor.ContainerDec.copyWith(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sound on',
                        style: TextStyles.StyleText,
                      ),
                    ),
                    Switch(
                      activeColor: Colors.white,
                      value: light2,
                      onChanged: (bool value) {
                        setState(() {
                          light2 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'Notification time',
                style: TextStyles.StyleText.copyWith(fontSize: 30),
              ),
              Text(
                'Send me notifications',
                style: TextStyles.StyleText,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                height: 70,
                decoration: ContainerDecor.ContainerDec.copyWith(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('from', style: TextStyles.StyleText),
                      ),
                      Container(
                        width: 120,
                        decoration: ContainerDecor.DownMenuBox,
                        child: DropdownMenu(
                          width: 120,
                          dropdownMenuEntries: time0
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                          textAlign: TextAlign.center,
                          trailingIcon: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
                          selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,),
                          textStyle: TextStyles.StyleText.copyWith(
                              color: Colors.white, fontSize: 17),
                          inputDecorationTheme: DropDownMenuDec.MenuDec,
                          initialSelection: dropdownValue0,
                          onSelected: (String? newValue0) {
                            setState(() {
                              dropdownValue0 = newValue0;
                            });
                          },
                        ),
                      ),
                      Text('to', style: TextStyles.StyleText),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 115,
                          decoration: ContainerDecor.DownMenuBox,
                          child: DropdownMenu(
                            width: 115,
                            dropdownMenuEntries: time1
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                            textAlign: TextAlign.center,
                            trailingIcon: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
                            selectedTrailingIcon: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,),
                            textStyle: TextStyles.StyleText.copyWith(
                                color: Colors.white, fontSize: 17),
                            inputDecorationTheme: DropDownMenuDec.MenuDec,
                            initialSelection: dropdownValue1,
                            onSelected: (String? newValue1) {
                              setState(() {
                                dropdownValue1 = newValue1;
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

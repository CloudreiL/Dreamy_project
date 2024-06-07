import 'package:flutter/material.dart';
import 'package:dreamy_project/pages/test.dart';

import 'package:dreamy_project/classes/style.dart';

class SleepPage extends StatefulWidget{
  const SleepPage({super.key});

  @override
  _SleepPageState createState() => _SleepPageState();

}

class _SleepPageState extends State<SleepPage>{

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
          title: Text('Sleep', style: TextStyles.StyleText.copyWith(
            fontSize: 30
          )),
            backgroundColor: Colors.transparent
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(10), child:
                InkWell(
                  child: Image.asset("assets/images/buttons/Dream Diary.png", width: 350,),
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage()),
                    );
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/buttons/Dream Calendar.png", width: 350,),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/buttons/Dream Book.png", width: 350,),
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

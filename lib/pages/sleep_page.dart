import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dreamy_project/classes/style.dart';

class SleepPage extends StatefulWidget{
  const SleepPage({super.key});

  @override
  _SleepPageState createState() => _SleepPageState();

}

class _SleepPageState extends State<SleepPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep', style: TextStyles.StyleText_title),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Color.fromRGBO(57, 34, 99, 1)],
                    )
                ),
              )
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dreamy_project/classes/style.dart';

class TestPage extends StatefulWidget{
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();

}

class _TestPageState extends State<TestPage>{

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
            title: Text('TestPage', style: TextStyles.StyleText.copyWith(
                fontSize: 30
            )),
            backgroundColor: Colors.transparent
        ),
      ),
    );
  }
}

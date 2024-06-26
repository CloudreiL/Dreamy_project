import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dreamy_project/classes/style.dart';

class UserPage extends StatefulWidget{
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();

}

class _UserPageState extends State<UserPage>{

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
          title: Text('User', style: TextStyles.StyleText.copyWith(
            fontSize: 30
          )),
            backgroundColor: Colors.transparent
        ),
      ),
    );
  }
}

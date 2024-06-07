import 'package:flutter/material.dart';


class TextStyles{
    static const TextStyle StyleText = TextStyle(
      fontSize: 20,
      fontFamily: 'FiraSans_Regular',
      color: Colors.white
  );
}

class TextFields{
  static InputDecoration FieldDec = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      labelStyle: TextStyles.StyleText,
      filled: true,
      fillColor: Color.fromRGBO(255, 255, 255, 200),

  );
}

class ContainerDecor{
  static BoxDecoration ContainerDec = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color.fromRGBO(103, 58, 183, 1), Color.fromRGBO(195, 66, 218, 1)],
      ),
      boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(0,3),
          spreadRadius: 1,
          blurRadius: 10
        )
      ],
      borderRadius: BorderRadius.circular(15)
  );
}

class PieData {
  final double value;
  final Color color;
  final Icon icon;
  final String title;

  PieData({required this.value, required this.color, required this.icon, required this.title});
}

final dataChart = [
  PieData(value: 10, color: Color.fromRGBO(134, 216, 120, 1), icon: Icon(Icons.sentiment_satisfied_alt, color: Colors.black,), title: ''),
  PieData(value: 20, color: Color.fromRGBO(140, 248, 255, 1), icon: Icon(Icons.sentiment_dissatisfied_outlined, color: Colors.black,), title: ''),
  PieData(value: 30, color: Color.fromRGBO(255, 178, 178, 1), icon: Icon(Icons.sentiment_very_dissatisfied_outlined, color: Colors.black,), title: ''),
  PieData(value: 40, color: Color.fromRGBO(255, 244, 142, 1), icon: Icon(Icons.sentiment_very_satisfied_rounded, color: Colors.black,), title: ''),
  PieData(value: 50, color: Colors.white, icon: Icon(Icons.sentiment_neutral_outlined, color: Colors.black,), title: '')
];

import 'package:flutter/material.dart';

class TextStyles{
    static const TextStyle StyleText_title = TextStyle(
      fontSize: 30,
      fontFamily: 'FiraSans_Regular',
      color: Colors.white
  );

    static const TextStyle StyleText_normal = TextStyle(
        fontSize: 20,
        fontFamily: 'FiraSans_Regular',
        color: Colors.white
    );

    static const TextStyle StyleText_smaller = TextStyle(
        fontSize: 15,
        fontFamily: 'FiraSans_Regular',
        color: Colors.white
    );
}

class TextFields{
  static InputDecoration FieldDec_1 = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      labelText: 'Email Address',
      labelStyle: TextStyles.StyleText_normal,
      filled: true,
      fillColor: Color.fromRGBO(255, 255, 255, 200),


  );

  static InputDecoration FieldDec_2 = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20)
      ),
      labelText: 'Password',
      labelStyle: TextStyles.StyleText_normal,
      filled: true,
      fillColor: Color.fromRGBO(255, 255, 255, 200),
  );
}
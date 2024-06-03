import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:dreamy_project/classes/curvednavbar.dart';

import 'package:dreamy_project/pages/registration_login/login_page.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegPage extends StatelessWidget {
  const RegPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:130),
                      child: Text(
                        'Create an account',
                        style: TextStyles.StyleText_title,
                      )
                  ),
                    Text(
                      "to get started now!",
                      style: TextStyles.StyleText_normal,
                    ),

                  SizedBox(height: 50),
                  Container(
                    width: 353,
                    height: 368,
                    decoration: BoxDecoration(
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
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                          child: Image.asset('assets/icons/app_icon/android/res/mipmap-xxxhdpi/Dreamy_monochrome.png', width: 98, height: 77,),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0,3),
                                    spreadRadius: 5,
                                    blurRadius: 10
                                ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: TextFields.FieldDec_1,
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText_normal,
                            ),
                          ),
                        ), //Поле почты
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0,3),
                                    spreadRadius: 5,
                                    blurRadius: 10
                                ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              decoration: TextFields.FieldDec_2,
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText_normal,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    offset: Offset(0,3),
                                    spreadRadius: 5,
                                    blurRadius: 10
                                ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: TextFields.FieldDec_3,
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText_normal,
                            ),
                          ),
                        ),
                        // Поле пароля
                        SizedBox(height: 15),
                        Padding(padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          child: Container(
                              width: 250,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const BottomNavBar(),
                                      )
                                  );
                                },
                                child: GradientText(
                                  'Sign Up',
                                  style: TextStyles.StyleText_normal,
                                  colors: [
                                    Color.fromRGBO(195, 66, 218, 1),
                                    Color.fromRGBO(103, 58, 183, 1)
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                              )
                          ),
                        ), //Кнопка логина
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                      "Or Sign Up with",
                                      style: TextStyles.StyleText_smaller
                                  ),
                                ),
                                Expanded(child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            child: Image.asset("assets/images/google-symbol.png", height: 31, width: 31),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?",
                                style: TextStyles.StyleText_smaller,
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    )
                                );
                              },
                                  child: Text("Login Now",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'FiraSans_Regular',
                                          color: Color.fromRGBO(216, 120, 213, 1)
                                      )
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}

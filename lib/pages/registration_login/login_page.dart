import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:dreamy_project/classes/curvednavbar.dart';
import 'package:dreamy_project/pages/registration_login/registration_page.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                        'Welcome to Dreamy',
                        style: TextStyles.StyleText.copyWith(
                          fontSize: 30
                        ),
                      )
                  ),
                  Text(
                      "Let's see what your dreams are!",
                      style: TextStyles.StyleText,
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
                            Padding(padding: EdgeInsets.only(top:10,bottom: 20),
                              child: Image.asset('assets/icons/app_icon/android/res/mipmap-xxxhdpi/Dreamy_monochrome.png', width: 98, height: 77,),
                            ),
                            Padding(padding: EdgeInsets.all(10),
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
                                  decoration: TextFields.FieldDec.copyWith(
                                    labelText: 'Email Address'
                                  ),
                                  cursorColor: Colors.white,
                                  style: TextStyles.StyleText,
                                ),
                              ),
                            ), //Поле почты
                            SizedBox(height: 20,),
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
                                  decoration: TextFields.FieldDec.copyWith(
                                    labelText: 'Password'
                                  ),
                                  cursorColor: Colors.white,
                                  style: TextStyles.StyleText,
                                ),
                              ),
                            ),
                            // Поле пароля
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: (){},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'FiraSans_Regular',
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                      'Login',
                                      style: TextStyles.StyleText,
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
                                      "Or login with",
                                      style: TextStyles.StyleText.copyWith(
                                        fontSize: 15
                                      )
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
                              Text("Don't have an account?",
                                  style: TextStyles.StyleText.copyWith(
                                    fontSize: 15
                                  )
                              ),
                              TextButton(onPressed: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegPage(),
                                    )
                                );
                              },
                                  child: Text("Sign Up Now",
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

import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:dreamy_project/pages/registration_login/login_page.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dreamy_project/pages/registration_login/email.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  static String email = '';
  static String firstPassword = '';
  static String secPassword = '';

  bool isHidden0 = true;
  bool isHidden1 = true;

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
                        style: TextStyles.StyleText.copyWith(
                          fontSize: 30
                        ),
                      )
                  ),
                    Text(
                      "to get started now!",
                      style: TextStyles.StyleText,
                    ),

                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    margin: EdgeInsets.only(left:20, right:20),
                    height: 368,
                    decoration: ContainerDecor.ContainerDec,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10,bottom: 10),
                          child: Image.asset('assets/icons/app_icon/android/res/mipmap-xxxhdpi/Dreamy_monochrome.png', width: 98, height: 77,),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 1,
                            margin: EdgeInsets.only(left:5, right:5),
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

                              onChanged: (value0) {
                                 email = value0;
                              },
                            ),
                          ),
                        ), //Поле почты
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 1,
                            margin: EdgeInsets.only(left:5, right:5),
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
                              obscureText: isHidden0,
                              decoration: TextFields.FieldDec.copyWith(
                                labelText: 'Password',
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      isHidden0 = !isHidden0;
                                    });
                                  }, icon: Icon(
                                    isHidden0? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: Colors.white,
                                  ))
                              ),
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText,

                              onChanged: (value1) {
                                firstPassword = value1;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 1,
                            margin: EdgeInsets.only(left:5, right:5),
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
                              obscureText: isHidden1,
                              decoration: TextFields.FieldDec.copyWith(
                                labelText: 'Confirm Password',
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      isHidden1 = !isHidden1;
                                    });
                                  }, icon: Icon(
                                    isHidden1? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: Colors.white,
                                  ))
                              ),
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EmailVerification(userEmail: email),
                                      )
                                  );
                                },
                                child: GradientText(
                                  'Sign Up',
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SizedBox(height: MediaQuery.of(context).size.height * 0.5/ 100,),
                  ),
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
                              Text("Already have an account?",
                                style: TextStyles.StyleText.copyWith(
                                  fontSize: 15
                                ),
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

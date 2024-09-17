import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:dreamy_project/classes/curvednavbar.dart';
import 'package:dreamy_project/pages/registration_login/registration_page.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;
  static String emailF = '';
  static String passwordF = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  //final user = FirebaseAuth.instance.currentUser;

  @override
  void initState(){
    super.initState();
    emailF = '';
    passwordF = '';
  }

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13,
                      ),
                      Text(
                        'Welcome to Dreamy',
                        style: TextStyles.StyleText.copyWith(
                          fontSize: 30
                        ),
                      ),
                      Text(
                        "Let's see what your dreams are!",
                        style: TextStyles.StyleText,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    margin: EdgeInsets.only(left:20, right:20),
                    height: 368,
                    decoration: ContainerDecor.ContainerDec,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top:10,bottom: 20),
                          child: Image.asset('assets/icons/app_icon/android/res/mipmap-xxxhdpi/Dreamy_monochrome.png', width: 98, height: 77,),
                        ),
                        Padding(padding: EdgeInsets.all(10),
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              decoration: TextFields.FieldDec.copyWith(
                                labelText: 'Email Address'
                              ),
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText,
                              onChanged: (value0) {
                                emailF = value0;
                              },
                            ),
                          ),
                        ), //Поле почты
                        SizedBox(height: 20),
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
                              controller: passwordController,
                              obscureText: isHidden,
                              decoration: TextFields.FieldDec.copyWith(
                                labelText: 'Password',
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                }, icon: Icon(
                                  isHidden? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: Colors.white,
                                ))
                              ),
                              cursorColor: Colors.white,
                              style: TextStyles.StyleText,

                              onChanged: (value1) {
                                passwordF = value1;
                              },
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
                                    if(emailF.isEmpty || passwordF.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Oops! Looks like not everything is filled :(',
                                              style: TextStyle(
                                                  fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white
                                              ),
                                            ),
                                            duration:Duration(seconds: 2),
                                          )
                                      );
                                    }else if(!EmailValidator.validate(emailF)){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Input correct email',
                                              style: TextStyle(
                                                  fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white
                                              ),
                                            ),
                                            duration:Duration(seconds: 2),
                                          )
                                      );
                                    }
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
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
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
                      SizedBox(height: 15),
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
    );
  }
}

import 'package:dreamy_project/classes/curvednavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dreamy_project/classes/style.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dreamy_project/pages/registration_login/registration_page.dart';

class EmailVerification extends StatefulWidget{

  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isVerified = false;
  String? userEmail;
  Timer? timer;

  @override
  void initState(){
    super.initState();

    userEmail = null;

    final user = FirebaseAuth.instance.currentUser;
    isVerified = user!.emailVerified;
    userEmail = user.email;

    if(!isVerified){
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3),
          (_) => checkEmailVerified(),

      );
    }
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    print(isVerified);

    if(isVerified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    }catch(e){
      print(e);
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Unknown error. Please contact TechSupp',
                style: TextStyle(
                    fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white
                ),
              ),
              duration:Duration(seconds: 2),
            )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => isVerified
  ? const BottomNavBar()
  :Container(
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                Text(
                  'Email',
                  style: TextStyles.StyleText.copyWith(
                      fontSize: 30
                  ),
                ),
                Text(
                  "verification",
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
                        child: Icon(Icons.email_outlined, color: Colors.white, size: 70),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.only(left:20, right:20),
                        height: 250,

                        decoration: ContainerDecor.WhiteBox,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Text(
                                'Account confirmation email sent to',
                                textAlign: TextAlign.center,
                                style: TextStyles.StyleText.copyWith(fontSize: 25),
                                maxLines: 2,
                              ),
                            Text(
                              '$userEmail',
                              textAlign: TextAlign.center,
                              style: TextStyles.StyleText.copyWith(fontSize: 20),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>  RegPage(),
                                    )
                                );
                              },
                              child: GradientText(
                                'Wrong email',
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
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
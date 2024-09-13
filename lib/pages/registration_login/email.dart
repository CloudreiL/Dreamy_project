import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:dreamy_project/pages/registration_login/registration_page.dart';

class EmailVerification extends StatelessWidget{

  final String userEmail;
  const EmailVerification({Key? key, required this.userEmail}) : super(key: key);



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
        body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top:130),
                  child: Text(
                    'Email',
                    style: TextStyles.StyleText.copyWith(
                        fontSize: 30
                    ),
                  )
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
                                    builder: (context) => const RegPage(),
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
    );
  }
}
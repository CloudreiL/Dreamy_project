import 'package:dreamy_project/classes/style.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Color.fromRGBO(57, 34, 99, 1)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 270,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromRGBO(103, 58, 183, 1),
                            Color.fromRGBO(195, 66, 218, 1),
                          ],
                        ),
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 3),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200),
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 162,
                            height: 162,
                            margin: EdgeInsets.only(top: 200),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                padding: EdgeInsets.only(left: 1, bottom: 13),
                                icon: GradientIcon(
                                  icon: Icons.add,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(195, 66, 218, 1),
                                      Color.fromRGBO(103, 58, 183, 1)
                                    ],
                                  ),
                                  size: 40,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'User',
                          style: TextStyles.StyleText.copyWith(fontSize: 30),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Your week',
                                style: TextStyles.StyleText,
                              ),
                              Container(
                                  height: 80,
                                  width: MediaQuery.of(context).size.width * 1,
                                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                                  decoration: ContainerDecor.ContainerDec.copyWith(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Color.fromRGBO(103, 58, 183, 1),
                                        Color.fromRGBO(195, 66, 218, 1)
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                  width: 198,
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: GradientText(
                                      'Edit profile',
                                      style: TextStyles.StyleText,
                                      colors: [
                                        Color.fromRGBO(195, 66, 218, 1),
                                        Color.fromRGBO(103, 58, 183, 1)
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                  )),
                              Container(
                                  width: 198,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: GradientText(
                                      'Settings',
                                      style: TextStyles.StyleText,
                                      colors: [
                                        Color.fromRGBO(195, 66, 218, 1),
                                        Color.fromRGBO(103, 58, 183, 1)
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

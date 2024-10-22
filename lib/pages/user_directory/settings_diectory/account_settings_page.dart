import 'package:dreamy_project/pages/registration_directory/login_page.dart';
import 'package:dreamy_project/services/firebase_stream.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class AccountSettingsPage extends StatefulWidget{
  AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {

  TextEditingController userName = TextEditingController();
  String? userUID;
  String? userEmail;

  void initState() {
    super.initState();
    _requestUID();
  }

  void _requestUID() async{
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      if(user!= null){
        userUID = user.uid;
        userEmail = user.email;
      }else{
        userUID = 'Failed to fetch user UID';
        userEmail = 'Failed to fetch user E-mail';
      }
    });
  }

  void _deleteAccount() async {
    try {
      FirebaseAuth.instance.currentUser!.delete();
      FirebaseAuth.instance.signOut();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'You have successfully deleted your account',
            style: TextStyle(
                fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        ),
      );

    } catch (e) {
      print('Ошибка $e');
    }
  }

    Future<void> _showAlertDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Delete Your Account?", style: TextStyles.StyleText),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Are you sure you want to Delete Your Account?',
                        style: TextStyles.StyleText)
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Yes', style: TextStyles.StyleText),
                  onPressed: () {
                    _deleteAccount();
                  },
                ),
                TextButton(
                  child: Text('No', style: TextStyles.StyleText),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

              ],
              backgroundColor: Colors.black,
            );
          }
      );
    }

    @override
    void dispose() {
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: ContainerDecor.BackgroundStyle,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Account Settings',
                style: TextStyles.StyleText.copyWith(fontSize: 30)),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.check, color: Colors.white, size: 30,))
            ],
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.03),
                Container(
                  decoration: ContainerDecor.ContainerDec,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130,
                        height: 130,

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
                      Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.7,
                        child: TextField(
                          decoration: TextFields.FieldDec.copyWith(
                            label: Center(child: Text("User")),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          cursorColor: Colors.white,
                          style: TextStyles.StyleText,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.top,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            "User UID",
                            style: TextStyles.StyleText.copyWith(
                                fontSize: 20
                            )
                        ),
                      ),
                      Expanded(child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    decoration: ContainerDecor.WhiteBox,
                    child: Center(child: Text(
                        userUID.toString(), style: TextStyles.StyleText))
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Clipboard.setData(ClipboardData(
                              text: userUID.toString()));
                        },
                        child: GradientText(
                          'Copy',
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            "User E-mail",
                            style: TextStyles.StyleText.copyWith(
                                fontSize: 20
                            )
                        ),
                      ),
                      Expanded(child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    decoration: ContainerDecor.WhiteBox,
                    child: Center(child: Text(
                        userEmail.toString(), style: TextStyles.StyleText))
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                  ),
                Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: GradientText(
                        'Reset password',
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
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.01,),
                Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAlertDialog();
                      },
                      child: Text('Delete account',
                          style: TextStyles.StyleText.copyWith(
                              color: Colors.red)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
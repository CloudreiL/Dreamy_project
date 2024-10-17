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

  @override
  void dispose(){
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: ContainerDecor.BackgroundStyle,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:AppBar(
          title: Text('Account Settings', style: TextStyles.StyleText.copyWith(fontSize: 30)),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed:(){
              Navigator.pop(context);
            }, icon: Icon(Icons.check, color: Colors.white, size: 30,))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                decoration: ContainerDecor.ContainerDec,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
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
                      width: MediaQuery.of(context).size.width * 0.7,
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
              Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: ContainerDecor.WhiteBox,
                child: Center(child: Text(userUID.toString(), style: TextStyles.StyleText))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: userUID.toString()));
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
              Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: ContainerDecor.WhiteBox,
                  child: Center(child: Text(userEmail.toString(), style: TextStyles.StyleText))
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                child: Expanded(child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                ),
              ),
              Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: ()  {},
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: ()  {},
                    child: Text('Delete account', style: TextStyles.StyleText.copyWith(color: Colors.red)),
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
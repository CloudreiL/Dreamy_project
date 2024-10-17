import 'package:dreamy_project/pages/user_directory/settings_diectory/account_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:dreamy_project/classes/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../registration_directory/login_page.dart';

class SettingsPage extends StatefulWidget{
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        )
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'You have successfully logged out of your account',
          style: TextStyle(
              fontSize: 15, fontFamily: 'FiraSans_Regular', color: Colors.white),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: ContainerDecor.BackgroundStyle,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Settings", style: TextStyles.StyleText.copyWith(fontSize: 30)),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body:
        Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountSettingsPage())
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: ContainerDecor.ContainerDec,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Icon(Icons.account_circle_outlined, size: 30, color: Colors.white,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text('Account', style: TextStyles.StyleText.copyWith(fontSize: 25)),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined, size: 40, color: Colors.white)
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              InkWell(
                onTap: (){
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: ContainerDecor.ContainerDec,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Icon(Icons.data_usage_outlined, size: 30, color: Colors.white,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text('Appearance', style: TextStyles.StyleText.copyWith(fontSize: 25)),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined, size: 40, color: Colors.white)
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              InkWell(
                onTap: (){
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: ContainerDecor.ContainerDec,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Icon(Icons.help_outline_outlined, size: 30, color: Colors.white,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text('Support', style: TextStyles.StyleText.copyWith(fontSize: 25)),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined, size: 40, color: Colors.white)
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              InkWell(
                onTap: (){
                  signOut();
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: ContainerDecor.RedGradientBox,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Icon(Icons.logout, size: 30, color: Colors.white,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Text('Log Out', style: TextStyles.StyleText.copyWith(fontSize: 25)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
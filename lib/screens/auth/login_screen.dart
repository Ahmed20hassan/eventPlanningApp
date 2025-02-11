import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/providers/user_provider.dart';
import 'package:todo/screens/auth/registor_screen.dart';
import 'package:todo/screens/home/HomeScreen.dart';
import 'package:todo/screens/home/taps/home_tap/home_tap.dart';

class LogoScreen extends StatefulWidget {
  static const String routName='logoScreen';
   LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  bool secondSwitchValue=false;
var emilController=TextEditingController();

var passwordController=TextEditingController();
int counter=0;
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/logo.png',
              height: 150,),
              SizedBox(height: 24,),
              TextField(
                controller: emilController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'email'.tr(),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).focusColor,
                      ),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).focusColor,
                      ),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              SizedBox(height: 24,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  labelText: 'password'.tr(),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).focusColor
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                    ),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).focusColor,
                      ),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).focusColor,
                      ),
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Text.rich(
                  textAlign: TextAlign.end,
                  TextSpan(
                children: [
                  TextSpan(
                    text: 'forget_password'.tr(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor:  Theme.of(context).primaryColor,
                  )
                  )
                ],
          
              )
              ),
          
              SizedBox(height: 24,),
              ElevatedButton(
                onPressed : (){
                 FirebaseManeger.login(
                   emilController.text, passwordController.text,
                       () {
                     showDialog(
                         context: context,
                         builder: (context) => AlertDialog(
                           backgroundColor: Colors.white,
                           title: Center(
                             child: CircularProgressIndicator(),
                           ),
                         ));
                   }, () {  Navigator.pop(context);
                      userProvider.initUser();
                  Navigator.pushNamedAndRemoveUntil(context, Homescreen.routName,(rout)=>false);
                 }, (massege) {
                   Navigator.pop(context);
                   showDialog(
                       context: context,
                       builder: (context) => AlertDialog(
                         backgroundColor: Colors.white,
                         title: Text('ronge'),
                         content: Text(massege),
                         actions: [
                           ElevatedButton(
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                               child: Text('OK'))
                         ],
                       )
                   );
                 },
                 );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Color(0xFF5669FF),
                ),
                child: Text(
                  'login'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 24,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RegistorScreen.routName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                    TextSpan(
                  children: [
                    TextSpan(
                        text: 'do_not_have_account'.tr()),
                    TextSpan(
          
                        text: 'create_account'.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor
                    )),
                  ]
                )),
              ),
              SizedBox(height: 24,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 10,
                      color: Theme.of(context).primaryColor,
                      height: 3,
                    ),
                  ),
                  Text('OR',
                  style: Theme.of(context).textTheme.titleSmall,),
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      indent: 10,
                      color: Theme.of(context).primaryColor,
                      height: 3,
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16,),
            InkWell(
              onTap: ()async{
                await FirebaseManeger.loginWithGoogle();
                Navigator.pushNamedAndRemoveUntil(context, Homescreen.routName,(rouy)=>false);
          
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/super g.png'),
                    SizedBox(width: 16,),
                    Text('Login With Google',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor
                    ),),
                  ],
                ),
              ),
            ),
              SizedBox(height: 16,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedToggleSwitch.dual(
                      current: secondSwitchValue,
                      first: false,
                      second: true,
                      spacing: 10,
                      style: ToggleStyle(
                        borderColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        indicatorColor: Theme.of(context).primaryColor,
                      ),
                      borderWidth: 3,
                      height: 50,
                      onChanged: (value){
                        setState(() {
                          secondSwitchValue = value;
                          if(value == true ){
                            context.setLocale(Locale('en'));
                            print(context.locale.toString());
                          }else{
                            context.setLocale(Locale('ar'));
                            print(context.locale.toString());
                          }
                        });
                      },
                      // onChanged:(value) => setState(() => secondSwitchValue = value),
                      iconBuilder: (value)=>value?Image.asset('assets/images/LR.png',height: 40,width: 40,):Image.asset('assets/images/EG.png',height:40,width: 40,),
                      textBuilder: (value)=>value?Image.asset('assets/images/EG.png',height: 40,width: 40,):Image.asset('assets/images/LR.png',height:40,width: 40,),
                      textMargin: EdgeInsets.zero,
          
                    )
          
                  ],
                  )
            ],
          ),
        ),
      ),
    );
  }



}

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/screens/auth/login_screen.dart';

class RegistorScreen extends StatefulWidget {
  static const String routName = 'RegistorScreen';
  RegistorScreen({super.key});

  @override
  State<RegistorScreen> createState() => _RegistorScreenState();
}

class _RegistorScreenState extends State<RegistorScreen> {
  bool secondSwitchValue=false;

  var nameController = TextEditingController();

  var emilController = TextEditingController();

  var passwordController = TextEditingController();

  var rePasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (valua) {
                      if (valua == null || valua.isEmpty) {
                        return 'name is required';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'name'.tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (valua) {
                      if (valua == null || valua.isEmpty) {
                        return 'email is required';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                          .hasMatch(valua);
                      if (emailValid == false) {
                        return 'the email mast be good';
                      }
                      return null;
                    },
                    controller: emilController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'email'.tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'the password mast by required';
                      }
                      if (value!.length < 6) {
                        return "the password mast by required";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      labelText: 'password'.tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'the password mast by required';
                      }
                      return null;
                    },
                    controller: rePasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      labelText: 're_password'.tr(),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FirebaseManeger.creatAccount(
                          nameController.text,
                            emilController.text,
                          passwordController.text,
                              () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ));
                        }, () {
                          Navigator.pop(context);
                          Navigator.pop(context);
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Color(0xFF5669FF),
                    ),
                    child: Text(
                      'create_account'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LogoScreen.routName);
                    },
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(text: 'already_have_account'.tr()),
                          TextSpan(
                              text: 'login'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Theme.of(context).primaryColor)),
                        ])),
                  ),
                  SizedBox(
                    height: 24,
                  ),
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
        ),
      ),
    );
  }
}

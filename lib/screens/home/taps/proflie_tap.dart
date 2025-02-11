import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/screens/auth/lets_go_screen.dart';
import 'package:todo/screens/auth/login_screen.dart';

class ProflieTap extends StatefulWidget {
  ProflieTap({super.key});

  @override
  State<ProflieTap> createState() => _ProflieTapState();
}

class _ProflieTapState extends State<ProflieTap> {
  UserMolde? user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    UserMolde? userData = await FirebaseManeger.readUser();
    setState(() {
      user = userData;
    });
  }

  String dropdown = "English";
  String dropdown2 = "Light";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
        toolbarHeight: 160,
        backgroundColor: Color(0xFF5669FF),
        title: Row(
          children: [
            Image.asset('assets/images/Rectangle 76.png'),
            SizedBox(
              width: 24,
            ),
            Column(
              children: [
                Text(
                  "${user?.name}",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).hintColor),
                ),
                Text(
                  '${user?.email}',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Color(0xFFFF5659),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              GoogleSignIn googleSignIn=GoogleSignIn();
              googleSignIn.disconnect();
              FirebaseManeger.loGout();
              Navigator.pushNamedAndRemoveUntil(
                  context, LogoScreen.routName, (rout) => false);
            },
            child: Row(
              children: [
                Icon(
                  Icons.login,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 16),
                Text(
                  'login'.tr(),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            )),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'language'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).dividerColor),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: Color(0xFF5669FF)),
            ),
            child: DropdownButton(
                isExpanded: true,
                focusColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 16),
                underline: Container(
                  height: 3,
                ),
                value: dropdown,
                items: [
                  DropdownMenuItem(
                      value: "English", child: Text('english'.tr())),
                  DropdownMenuItem(
                      value: "Arbic", child: Text('arbic'.tr())),
                ],
                onChanged: (String? valua) {

                    dropdown = valua!;
                    if (dropdown == 'English') {
                      dropdown='English';
                      context.setLocale(Locale('en')); // تغيير اللغة إلى الإنجليزية
                    } else {
                      dropdown='Arbic';
                      context.setLocale(Locale('ar')); // تغيير اللغة إلى العربية
                    }

                }
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'theme'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).dividerColor),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: Color(0xFF5669FF)),
            ),
            child: DropdownButton(
                isExpanded: true,
                focusColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 16),
                underline: Container(
                  height: 3,
                ),
                value: dropdown2,
                items: [
                  DropdownMenuItem(
                      value: "Light", child: Text('light'.tr())),
                  DropdownMenuItem(
                      value: "Dark", child: Text('dark'.tr())),
                ],
                onChanged: (String? valua) {
                  dropdown2 = valua!;
                  setState(() {
                    if (dropdown2 == "Light") {
                      dropdown2='Light';
                      provider.themeMode = ThemeMode.dark;
                      provider.ChangTheme();
                    } else {
                      dropdown2='Dark';
                      provider.themeMode = ThemeMode.light;
                      provider.ChangTheme();
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}

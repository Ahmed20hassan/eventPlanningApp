import 'package:flutter/material.dart';
import 'package:todo/screens/login_screen.dart';

class RegistorScreen extends StatelessWidget {
  static const String routName = 'RegistorScreen';
  RegistorScreen({super.key});
  var emilController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style:
        Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            TextField(
              controller: emilController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
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
            TextField(
              controller: emilController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
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
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                labelText: 'Password',
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
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                labelText: 'Re Password',
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
                Navigator.pushNamed(context, RegistorScreen.routName);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Color(0xFF5669FF),
              ),
              child: Text(
                'Register',
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
              onTap: (){
                Navigator.pushNamed(context,LogoScreen.routName);
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(text: 'I Have Account ? '),
                    TextSpan(
                        text: 'Login',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor)),
                  ])),
            ),
            SizedBox(
              height: 24,
            ),

          ],
        ),
      ),
    );
  }
}

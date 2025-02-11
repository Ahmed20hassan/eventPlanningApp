import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/home/taps/home_tap/edit_event.dart';
import 'package:todo/introduction_screen.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/providers/user_provider.dart';
import 'package:todo/screens/auth/login_screen.dart';
import 'package:todo/screens/auth/registor_screen.dart';
import 'package:todo/screens/creet_event/creat_event.dart';
import 'package:todo/screens/home/HomeScreen.dart';
import 'package:todo/screens/auth/lets_go_screen.dart';
import 'package:todo/screens/home/taps/home_tap/eventDetails.dart';
import 'package:todo/screens/home/taps/home_tap/home_tap.dart';
import 'package:todo/theme/dark_theme.dart';
import 'package:todo/theme/light_theme.dart';
import 'package:todo/theme/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>MyProvider()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
    ],
    child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: const MyApp()),
  ),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    BaseTheme theme = LightTheme();
    BaseTheme darkTheme = DarkTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      darkTheme: darkTheme.themeData,
      theme: theme.themeData,
      themeMode: provider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute:userProvider.FirebasUser!=null?Homescreen.routName: IntroductionScreen.routName,
      routes: {
        IntroductionScreen.routName: (context) => IntroductionScreen(),
        Onbording.routName: (context) => Onbording(),
        RegistorScreen.routName: (context) => RegistorScreen(),
        LogoScreen.routName: (context) => LogoScreen(),
        Homescreen.routName: (context) =>Homescreen(),
        HomeTap.routName: (context) =>HomeTap(),
        CreatEvent.routName: (context) =>CreatEvent(),
        EditEvent.routName: (context) =>EditEvent(),
        EventDetails.routName: (context) =>EventDetails(),

      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/screens/creat_event.dart';
import 'package:todo/screens/home/HomeScreen.dart';
import 'package:todo/screens/lets_go_screen.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:todo/screens/registor_screen.dart';
import 'package:todo/theme/dark_theme.dart';
import 'package:todo/theme/light_theme.dart';
import 'package:todo/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
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
      initialRoute: IntroductionScreen.routName,
      routes: {
        IntroductionScreen.routName: (context) => IntroductionScreen(),
        RegistorScreen.routName: (context) => RegistorScreen(),
        LogoScreen.routName: (context) => LogoScreen(),
        Homescreen.routName: (context) =>Homescreen(),
        CreatEvent.routName: (context) =>CreatEvent(),

      },
    );
  }
}

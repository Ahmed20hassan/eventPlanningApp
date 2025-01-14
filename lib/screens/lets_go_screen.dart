import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routname = 'letsGoScreen';
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_loge.png"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 18),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Color(0xFF5669FF),
          ),
          onPressed: () {},
          child: Text(
            'lets_start'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/intro_img.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              'introduction_titel'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              'introduction_descrption'.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'language'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ToggleSwitch(
                  minHeight: 30,
                  minWidth: 70,
                  cornerRadius: 20,
                  activeBgColors: [
                    context.locale.toString() == 'en'
                        ? [Color(0xFF5669FF), Color(0xffae9e9e)]
                        : [Color(0xffdab3b3), Color(0xFF5669FF)],
                    context.locale.toString() != 'en'
                        ? [Color(0xFF5669FF), Color(0xffae9e9e)]
                        : [Color(0xffdab3b3), Color(0xFF5669FF)],
                  ],
                  inactiveBgColor: Color(0xFFF2FEFF),
                  dividerMargin: 0,
                  borderColor: [Color(0xFF5669FF)],
                  borderWidth: 0.7,
                  totalSwitches: 2,
                  customWidgets: [
                    context.locale.toString() == 'en'
                        ? Image.asset("assets/images/LR.png")
                        : Image.asset("assets/images/EG.png"),
                    context.locale.toString() == 'en'
                        ? Image.asset("assets/images/EG.png")
                        : Image.asset("assets/images/LR.png"),
                  ],
                  onToggle: (index) {
                    if (context.locale.toString() == 'en') {
                      if (index == 0) {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('ar'));
                      }
                    } else {
                      if (index == 1) {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('ar'));
                      }
                    }
                  },
                )
              ],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'theme'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ToggleSwitch(
                  minHeight: 30,
                  minWidth: 70,

                  inactiveBgColor: Color(0xFFF2FEFF),
                  dividerMargin: 0,
                  borderColor: [Colors.blueAccent],
                  borderWidth: 0.7,
                  cornerRadius: 20,
                  totalSwitches: 2,
                  activeBgColors: [
                    provider.themeMode == ThemeMode.light
                        ? [Color(0xFF5669FF), Color(0xffa7d1c8)]
                        : [Color(0xff495c58), Color(0xFF101127)],
                    provider.themeMode != ThemeMode.light?
                    [Color(0xff495c58), Color(0xFF101127)]: [Color(0xFF5669FF), Color(0xffa7d1c8)],

                  ],
                  icons: [
                    provider.themeMode==ThemeMode.light?Icons.light_mode: Icons.dark_mode,
                    provider.themeMode!=ThemeMode.light?Icons.light_mode: Icons.dark_mode,
                  ],
                  iconSize:
                      30.0, // animate must be set to true when using custom curve
                  onToggle: (index) {
                    provider.ChangTheme();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

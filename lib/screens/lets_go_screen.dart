import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routname='letsGoScreen';
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/app_loge.png"),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(
          right: 16,left: 16,bottom: 18
        ),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            backgroundColor: Color(0xFF5669FF),
          ),
          onPressed: (){},
          child: Text('Let’s Start',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white
            ),),
        ),
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/intro_img.png',
            width: double.infinity,
            fit: BoxFit.fill,),
            SizedBox(height: 28,),
            Text('Personalize Your Experience',
            style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 28,),
            Text('Choose your preferred theme and language to get started with a '
                'comfortable, tailored experience that suits your style.',
            style: Theme.of(context).textTheme.titleSmall,),
            SizedBox(height: 28,),
            Row(
              children: [
                Text('Language',
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
            Row(
              children: [
                Text('Theme',
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
            SizedBox(height: 16,),

          ],
        ),
      ),
    );
  }
}

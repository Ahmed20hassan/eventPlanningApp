import 'package:flutter/material.dart';
import 'package:todo/screens/home/taps/home_tap/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
        ),
        centerTitle: false,
        toolbarHeight: 130,
        leadingWidth: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
            Text(
              'John Safwat',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
            ),
            Row(
              children: [
                Icon(Icons.pin_drop_outlined,color: Colors.white,),
                Text('Cairo , Egypt',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white, fontSize: 14),)
              ],
            ),
            Container(
              height: 50,
              color: Colors.green,
            )
          ],
        ),
        actions: [
          Icon(
            Icons.light_mode,
            color: Colors.white,
            size: 27,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Text(
              'EN',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context,i)=>SizedBox(height: 16,),
        itemBuilder: (context,index){
        return EventItem();
      },
      itemCount: 10,
      ),
    );
  }
}

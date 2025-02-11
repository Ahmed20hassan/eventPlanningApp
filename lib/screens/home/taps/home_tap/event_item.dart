import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/home/taps/home_tap/edit_event.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/home/taps/home_tap/eventDetails.dart';

class EventItem extends StatelessWidget {
  TaskModel mod;
   EventItem({required this.mod,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      margin: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, EventDetails.routName,arguments: mod);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/${mod.categry}.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${mod.tital}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),),
                    Icon(Icons.favorite_border),


                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16,left: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Column(
              children: [
                Text(DateTime.fromMicrosecondsSinceEpoch(mod.date).toString().substring(8,10),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,

                ),),
                Text(MilleScondToMothe(mod.date),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,), )
              ],
            ),
          )
        ],
      ),
    );
  }
  String MilleScondToMothe(int millesconds){
    DateTime dateTime=DateTime.fromMicrosecondsSinceEpoch(millesconds);
    return DateFormat('MMM','en').format(dateTime);
  }
}

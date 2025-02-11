import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/home/taps/home_tap/edit_event.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';

class EventDetails extends StatelessWidget {
  static const String routName = 'EventDeatils';
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var showTask = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {

                Navigator.pushNamed(context, EditEvent.routName,
                    arguments: showTask);
              },
              child: Icon(Icons.edit)),
          SizedBox(
            width: 16,
          ),
          InkWell(
              onTap: () {
                FirebaseManeger.deletEvent(showTask.id);
                Navigator.pop(context);
              },
              child: Icon(
                Icons.delete_forever_outlined,
                size: 33,
                color: Color(0xFFFF5659),
              )),
          SizedBox(
            width: 16,
          ),
        ],
        title: Text(
          "event_deatils".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/${showTask.categry}.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('${showTask.tital}',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: Icon(
                        Icons.calendar_month,
                        color: Theme.of(context).hintColor,
                      )),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${MilleScondToMothe(showTask.date)}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Text('${MilleScondTime(showTask.date)}',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'description'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).dividerColor),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              showTask.desciption,
              maxLines: 5,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).dividerColor),
            ),
          ],
        ),
      ),
    );
  }

  String MilleScondToMothe(int microseconds) {
    // تحويل الميكروثانية إلى ميلي ثانية
    int milliseconds = (microseconds / 1000).round();

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return DateFormat('dd MMMM yyyy', 'en').format(dateTime);
  }

  String MilleScondTime(int microseconds) {
    // تحويل الميكروثانية إلى ميلي ثانية
    int milliseconds = (microseconds / 1000).round();

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return DateFormat('hh:mm a', 'en').format(dateTime);
  }
}

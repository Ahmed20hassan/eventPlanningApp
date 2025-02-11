import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Widget/category_event_item.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/creat_event_provider.dart';

class CreatEvent extends StatelessWidget {
  static const String routName = 'creatEvent';
  CreatEvent({super.key});
  var titalcontrolle = TextEditingController();
  var descreptioncontrolle = TextEditingController();
var chooseDate="chose_date".tr();
var chooseTime="chose_time".tr();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CreatEventProvider(),
        builder: (context, index) {
          var provider = Provider.of<CreatEventProvider>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('create_event'.tr(),
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/${provider.eventCategories[provider.selectedCatigri]}.png',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 16,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                provider.ChangeCategry(index);
                              },
                              child: CategoryEventItem(
                                  text: ' ${provider.eventCategories[index]}',
                                  isSelected: provider.selectedCatigri == index));
                        },

                        itemCount: provider.eventCategories.length,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: titalcontrolle,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.edit_note),
                        labelText: 'titel'.tr(),
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
                      controller: descreptioncontrolle,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'description'.tr(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: 10,),
                            Text(
                              'event_date'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Theme.of(context).dividerColor),
                            ),

                          ],
                        ),
                        InkWell(
                          onTap: () async{
                            var shoseDate =await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(Duration(days: 360)),
                                lastDate: DateTime.now().add(Duration(days: 360)),

                            ); if( shoseDate!=null){
                            provider.ChanegSelectedDate(shoseDate);
                            }
                            chooseDate=provider.selectedDate.toString().substring(0,10);
                          },
                          child: Text(
                           chooseDate,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           Icon(Icons.calendar_month),
                           SizedBox(width: 10,),
                           Text(
                             'event_time'.tr(),
                             style: Theme.of(context)
                                 .textTheme
                                 .titleSmall!
                                 .copyWith(color: Theme.of(context).dividerColor),
                           ),

                         ],
                       ),
                        InkWell(
                          onTap: () async{
                            var shoseTime =await showTimePicker(
                                context: context,

                              initialTime: TimeOfDay.now(),
                            ); if( shoseTime!=null){
                              provider.ChanegSelectedTime(shoseTime);
                            }
                            chooseTime=provider.selectedTime!.format(context);

                          },
                          child: Text(
                           chooseTime,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed : (){
                          TaskModel task=TaskModel(
                            userId: FirebaseAuth.instance.currentUser!.uid,
                              tital: titalcontrolle.text,
                              desciption: descreptioncontrolle.text,
                              date: provider.selectedDate.microsecondsSinceEpoch,
                              counter:provider.selectedCatigri ,
                              categry: provider.imageName,);
                          FirebaseManeger.addEvent(task).then((valua){
                            Navigator.pop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Color(0xFF5669FF),
                        ),
                        child: Text(
                          'add_event'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/creat_event_provider.dart';
import 'package:todo/screens/home/taps/home_tap/home_tap.dart';

import '../../../../Widget/category_event_item.dart';
import '../../../../firebase/firebase_maneger.dart';
import '../../../../models/task_model.dart';

class EditEvent extends StatelessWidget {
  static const String routName = 'EditEvent';

int sele=0;

  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var titalcontrolle = TextEditingController(text: model.tital);
    var descreptioncontrolle = TextEditingController(text: model.desciption);
    return ChangeNotifierProvider(
        create: (context) => CreatEventProvider(),
        builder: (context, index) {
          var provider = Provider.of<CreatEventProvider>(context);
          // ✅ ضبط الفئة المختارة عند فتح الصفحة لأول مرة
          provider.imageName!=model.categry;
          return Scaffold(
            appBar: AppBar(
              title: Text('edit_event'.tr(),
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            body: FutureBuilder(
              future: FirebaseManeger.upEventData(model),
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/${provider.eventCategories[model.counter]}.png',
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
                                    model.categry=provider.imageName;
                                    provider.selectedCatigri=index;
                                    model.counter=index;
                                  },
                                  child: CategoryEventItem(
                                      text: ' ${provider.eventCategories[index]}',
                                      isSelected: model.counter==index
                                  )

                              );
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
                                .copyWith(
                                    color: Theme.of(context).focusColor),
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
                                .copyWith(
                                    color: Theme.of(context).focusColor),
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
                            Text(
                              'select_date'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColor),
                            ),
                            InkWell(
                              onTap: () async {
                                var shoseDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 360)),
                                  lastDate: DateTime.now()
                                      .add(Duration(days: 360)),
                                );
                                if (shoseDate != null) {
                                  provider.ChanegSelectedDate(shoseDate);
                                  sele+=1;
                                }
                              },
                              child: Text(
                                '${sele !=0?provider.selectedDate.toString().substring(0,11):DateTime.fromMicrosecondsSinceEpoch(model.date).toString().substring(0,11)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color:
                                            Theme.of(context).primaryColor),
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
                            onPressed: ()  {

                              TaskModel updatedModel = TaskModel(

                                counter: provider.selectedCatigri,
                                id: model.id, // نحتفظ بنفس المعرف
                                userId: model.userId, // معرف المستخدم يبقى كما هو
                                tital: titalcontrolle.text, // تحديث العنوان
                                desciption: descreptioncontrolle.text, // تحديث الوصف
                                date: provider.selectedDate.microsecondsSinceEpoch, // تحديث التاريخ
                                categry:  provider.eventCategories[provider.selectedCatigri], // تحديث الفئة المختارة
                              );

                              FirebaseManeger.upEventData(updatedModel).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("✅ تم تحديث الحدث بنجاح!")),
                                );
                                Navigator.pop(context); // الرجوع بعد التحديث
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("❌ حدث خطأ أثناء التحديث: $error")),
                                );
                              });
                             Navigator.pop(context);

                              },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Color(0xFF5669FF),
                            ),
                            child: Text(
                              'edit_event'.tr(),
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
                );
              },
            ),
          );
        }
        );

  }
}

String MilleScondToMothe(int millesconds){
  DateTime dateTime=DateTime.fromMicrosecondsSinceEpoch(millesconds);
  return DateFormat('MMM','en').format(dateTime);
}
/*TaskModel task = TaskModel(
  userId:
  FirebaseAuth.instance.currentUser!.uid,
  tital: titalcontrolle.text,
  desciption: descreptioncontrolle.text,
  date: provider
      .selectedDate.microsecondsSinceEpoch,
  categry: provider.imageName,
);*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/user_provider.dart';
import 'package:todo/screens/home/taps/home_tap/event_item.dart';

class HomeTap extends StatefulWidget{
  static const String routName='HomeTap';
   HomeTap({super.key});
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  /* List<String> eventCategories = [
    'All',
    'Birthday',
    'Book Club',
    'Eating',
    'Sport',
    'Exhibition',
    'Gaming',
    'Meeting',
    'Work Shope',
    'Holiday',
  ];*/
   List<String> eventCategories = [
    'all'.tr(),
    'birthday'.tr(),
    'book_club'.tr(),
    'eating'.tr(),
    'sport'.tr(),
    'exhibition'.tr(),
    'gaming'.tr(),
    'meeting'.tr(),
    'work_shop'.tr(),
    'holiday'.tr(),
  ];

  int selectedCatgroy=0;

  @override
  Widget build(BuildContext context) {
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWight=MediaQuery.of(context).size.width;
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        )),
        centerTitle: false,
        toolbarHeight: screenHeight*0.26,
        leadingWidth: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "welcome_back".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    Text(
                      userProvider.userMolde?.name??'null',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                  Row(
                    children: [
                      Icon(
                        Icons.light_mode,
                        color: Colors.white,
                        size: 27,
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8), color: Colors.white),
                        child: Text(
                          'EN',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),

              ],
            ),

            SizedBox(height: screenHeight*0.01,),
            Row(
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  color: Colors.white,
                ),
                Text(
                  'Cairo , Egypt',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white, fontSize: 14),
                )
              ],
            ),
            SizedBox(height: screenHeight*0.02,),
            SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context,index){
                  return SizedBox(width: 16,);
                },
                  scrollDirection: Axis.horizontal,
                  itemCount: eventCategories.length,
                  itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    selectedCatgroy=index;
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedCatgroy!=index?Theme.of(context).primaryColor:Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white,
                          width: 2
                        )
                      ),
                      child: Text(eventCategories[index],
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: selectedCatgroy==index?Theme.of(context).primaryColor:Theme.of(context).hintColor
                      ),)),
                );
              }),
            )
          ],
        ),

      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirebaseManeger.getEvents(selectedCatgroy),
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (context, i) => SizedBox(
                height: 16,
              ),
              itemBuilder: (context, index) {
                return EventItem(mod: snapshot.data!.docs[index].data());
              },
              itemCount: snapshot.data?.docs.length ?? 0,
            );
          }),
    );
  }
}

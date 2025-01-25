import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Widget/category_event_item.dart';
import 'package:todo/providers/creat_event_provider.dart';

class CreatEvent extends StatelessWidget {
  static const String routName = 'creatEvent';
   CreatEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CreatEventProvider(),
      builder: (context,index){
        var provider=Provider.of<CreatEventProvider>(context);
        return  Scaffold(
          appBar: AppBar(
            title:
            Text('Create Event', style: Theme.of(context).textTheme.titleLarge),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset('assets/images/${provider.imageName}.png',
                    fit: BoxFit.fill,)),
                SizedBox(height:  16,),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context,index){
                      return SizedBox(width: 16,);
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          provider.ChangeCategry(index);
                        },
                        child:CategoryEventItem(text:' ${provider.eventCategories[index]}',
                            isSelected: provider.selectedCatigri==index)
                      );
                    }
                    ,itemCount: provider.eventCategories.length,
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

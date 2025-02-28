import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class CreatEventProvider extends ChangeNotifier {
  int selectedCatigri=0;

  List<String> eventCategories = [
    'Birthday',
    'Book Club',
    'Eating',
    'Sport',
    'Exhibition',
    'Gaming',
    'Meeting',
    'Work Shope',
    'Holiday',
  ];
  var selectedDate = DateTime.now();
  TimeOfDay? selectedTime ;
  String get imageName => eventCategories[selectedCatigri];
  ChanegSelectedDate(DateTime? date){
    selectedDate=date!;
    notifyListeners();
  }
  ChanegSelectedTime(TimeOfDay? date){
    selectedTime=date;
    notifyListeners();
  }
  ChangeCategry(index){
    selectedCatigri=index;

    notifyListeners();
  }

}

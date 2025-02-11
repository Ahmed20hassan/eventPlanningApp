import 'package:flutter/material.dart';

class EditEventProvider extends ChangeNotifier {
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
  String get imageName => eventCategories[selectedCatigri];
ChanegSelectedDate(DateTime? date){
  selectedDate=date!;
  notifyListeners();
}
  ChangeCategry(index){
    selectedCatigri=index;
    notifyListeners();
  }
}

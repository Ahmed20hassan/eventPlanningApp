import 'package:flutter/material.dart';

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
  String get imageName => eventCategories[selectedCatigri];

  ChangeCategry(index){
    selectedCatigri=index;
    notifyListeners();
  }
}

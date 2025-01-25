import 'package:flutter/material.dart';

class CategoryEventItem extends StatelessWidget {
   CategoryEventItem({required this.text,required this.isSelected,super.key});
String text;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2
            ),
          color: isSelected ?Theme.of(context).primaryColor:Colors.transparent,
        ),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isSelected?Colors.white:Theme.of(context).primaryColor
        )));
  }
}

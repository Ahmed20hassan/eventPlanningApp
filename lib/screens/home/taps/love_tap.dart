import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

import 'home_tap/event_item.dart';

class LoveTap extends StatelessWidget {
   LoveTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText:  'Search for Event',
                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
                prefixIcon:  Icon(Icons.search,
                  color: Theme.of(context).primaryColor,
                  size: 36,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor
                  ),
                  borderRadius: BorderRadius.circular(16)
                ),
                focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor
                    ),
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

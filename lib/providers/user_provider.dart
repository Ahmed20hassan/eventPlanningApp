import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/firebase/firebase_maneger.dart';
import 'package:todo/models/user_model.dart';

class UserProvider extends ChangeNotifier{
  UserMolde? userMolde;
  User? FirebasUser;
  UserProvider(){
    FirebasUser=FirebaseAuth.instance.currentUser;
    if(FirebasUser!=Null){
      initUser();
    }
  }
  initUser()async{
    userMolde=await FirebaseManeger.readUser();
    notifyListeners();
  }
}
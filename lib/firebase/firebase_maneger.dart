

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';


class FirebaseManeger {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static CollectionReference<UserMolde> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserMolde>(
      fromFirestore: (snapshot, _) {
        return UserMolde.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static Future<void> addEvent(TaskModel task) {
    var collection = getTasksCollection();
    var decRef = collection.doc();
    task.id = decRef.id;
    return decRef.set(task);
  }

  static Future<void> addUser(UserMolde useer) {
    var collection = getUsersCollection();
    var decRef = collection.doc(useer.id);
    return decRef.set(useer);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(int categoryName) {
    var collection = getTasksCollection();
    if(categoryName==0){
      return collection
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy('date', descending: false)
          .snapshots();
    }else{
      return collection
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('counter', isEqualTo: categoryName-1)
          .orderBy('date', descending: false)
          .snapshots();
    }

  }

  static Future<UserMolde?>readUser()async{
    var collection = getUsersCollection();
    DocumentSnapshot<UserMolde> docRef=await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return docRef.data();
  }

  static Future<void> deletEvent(String id) {
    var collection = getTasksCollection();
    return collection.doc(id).delete();
  }

  /* static Future<void> upEventData(TaskModel model) async {
    try {
      await getTasksCollection().doc(model.id).update({
        "tital":model.tital,
        "desciption":model.desciption,
        "categry":model.categry,
        "date":model.date,
        "userId":model.userId,
        "id":model.id,
      });
      print("✅ تم تحديث البيانات في Firestore بنجاح!");
    } catch (e) {
      print("❌ حدث خطأ أثناء التحديث: $e");
      throw e; // نرمي الخطأ لكي يظهر في `catchError`
    }
  }*/
  static Future<void> upEventData(TaskModel model) {
    var collection = getTasksCollection();
   // return collection.snapshots()
    return collection.doc(model.id).update(model.toJson());
  }

  static creatAccount(String name,String emailAddress, String password, Function onLoading,
      Function onSsacces, Function onError) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserMolde userMolde=UserMolde(id: credential.user!.uid, name: name,
          email: emailAddress, createdAt: DateTime.now().microsecondsSinceEpoch);
      addUser(userMolde);
      onSsacces();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError('somthing is ronge');
      print(e);
    }
  }

  static Future<void> login(String emailAddress, String password,
      Function onLoading, Function onSsacces, Function onError) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user!.emailVerified) {
        onSsacces();
      } else {
        onError('check your email');
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
  static Future<void>loGout()async{
    await FirebaseAuth.instance.signOut();
  }
  static Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // المستخدم ألغى تسجيل الدخول

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) return;

      print("Google User Name: ${googleUser.displayName}");
      print("Firebase User Name: ${firebaseUser.displayName}");

      // تحديث `displayName` في FirebaseAuth إذا كان مفقودًا
      if (firebaseUser.displayName == null || firebaseUser.displayName!.isEmpty) {
        await firebaseUser.updateProfile(displayName: googleUser.displayName);
        await firebaseUser.reload();
        print("Updated Firebase User Name: ${firebaseUser.displayName}");
      }

      // تحديث البيانات في Firestore
      final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

      final DocumentSnapshot userDoc =
      await usersCollection.doc(firebaseUser.uid).get();

      if (!userDoc.exists) {
        UserMolde userModel = UserMolde(
          id: firebaseUser.uid,
          name: googleUser.displayName ?? firebaseUser.displayName ?? 'No Name',
          email: firebaseUser.email ?? 'No Email',
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        await usersCollection.doc(firebaseUser.uid).set(userModel.toJson());
      }

    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }


/*static Future<UserCredential> signInWithGoogle() async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes_app/note-page.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseFirestore.instance.settings =
  //   Settings(persistenceEnabled: false);
  await Firebase.initializeApp();

  // FirebaseFirestore.instance.settings=Settings(
  //   persistenceEnabled: false,
  // );
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child:
          FirebaseAuth.instance.currentUser?.uid == null ? Home() : Note_page(),
    );
  }
}

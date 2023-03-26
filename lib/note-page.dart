import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/add-note.dart';
import 'package:notes_app/signup.dart';

import 'auth.dart';
import 'edit.dart';

class Note_page extends StatefulWidget {
  const Note_page({super.key});

  @override
  State<Note_page> createState() => _Note_pageState();
}

class _Note_pageState extends State<Note_page> {
  Future<bool> _onWillPop() async {
    return true; //<-- SEE HERE
  }

  @override

  // static dynamic user = FirebaseAuth.instance.currentUser;
  // Auth ob=new Auth();
  final ref = FirebaseFirestore.instance.collection("notes");
  // dynamic data=

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.teal,
  ];

  Random random = new Random();
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                "My notes",
                style: TextStyle(color: Colors.teal),
              ),
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.yellow,
              actions: [
                TextButton.icon(
                    onPressed: () async {
                      await Auth.logout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Home()));
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                    label: Text(
                      "log out",
                      style: TextStyle(fontSize: 20),
                    ))
              ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("yaha par print kiya");
              print(ref);
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Add_note()),
                );
                // if(user != null)
                //   id=user!.uid;
                // <-- Code run after delay
              });

              print("nhi ruk rha");
            },
            child: Icon(
              Icons.add,
              size: 50,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
          body: SafeArea(
              child: Container(
                  padding: EdgeInsets.all(25),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.yellow, Colors.yellow],
                  )),
                  child: StreamBuilder(
                      stream: ref.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: snapshot.hasData
                                ? snapshot.data!.docs.length
                                : 0,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit(
                                              doctoedit:
                                                  snapshot.data!.docs[index],
                                            )),
                                  );
                                },
                                child: Card(
                                  color: colors[random.nextInt(5)],
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(snapshot.data!.docs[index]
                                          ['content']),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })))),
    );
  }
}

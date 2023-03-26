import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Add_note extends StatefulWidget {
  const Add_note({super.key});

  @override
  State<Add_note> createState() => _Add_noteState();
}

// ignore: camel_case_types
class _Add_noteState extends State<Add_note> {
  String title = "";
  String content = "";
  // dynamic id="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.teal, Colors.grey],
        )),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 200, 20, 0),
            child: Column(children: [
              const Text(
                "Add a new note",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    title = val;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'Title',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    //<-- SEE HERE
                    borderSide: const BorderSide(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (val) {
                  setState(() {
                    content = val;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  labelText: 'Text',
                  labelStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    //<-- SEE HERE
                    borderSide: const BorderSide(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: () {
                    // ignore: avoid_print
                    print("id print hoga yaha");
                    // dynamic user=FirebaseAuth.instance.currentUser;
                    // if(user != null)
                    // id=user.uid;
                    CollectionReference ref =
                        FirebaseFirestore.instance.collection("notes");
                    // print(id);
                    if (title != "" && content != "") {
                      ref.add({
                        'title': title,
                        'content': content
                      }).whenComplete(() => Navigator.pop(context));
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.save,
                    color: Colors.greenAccent,
                  ),
                  label: const Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 2, 250, 2)),
                  ))
            ]),
          ),
        ),
      ),
    ));
  }
}

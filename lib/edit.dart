import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Edit extends StatefulWidget {
  DocumentSnapshot doctoedit;
  Edit({super.key, required this.doctoedit});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController title1 = TextEditingController();
  TextEditingController content1 = TextEditingController();
  @override
  void initState() {
    title1 = TextEditingController(text: widget.doctoedit['title']);
    content1 = TextEditingController(text: widget.doctoedit['content']);

    // TODO: implement initState
    super.initState();
  }

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
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.teal, Colors.grey],
        )),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 200, 20, 0),
            child: Column(children: [
              Text(
                "Edit note",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: title1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: content1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    //<-- SEE HERE
                    borderSide: BorderSide(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: () {
                    print("id print hoga yaha");
                    // dynamic user=FirebaseAuth.instance.currentUser;
                    // if(user != null)
                    // id=user.uid;
                    CollectionReference ref =
                        FirebaseFirestore.instance.collection("notes");
                    // print(id);
                    if (title1.text != "" && content1.text != "") {
                      widget.doctoedit.reference.update({
                        'title': title1.text,
                        'content': content1.text
                      }).whenComplete(() => Navigator.pop(context));
                    } else
                      Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.save,
                    color: Colors.greenAccent,
                  ),
                  label: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 2, 250, 2)),
                  )),
              TextButton.icon(
                  onPressed: () {
                    // print("id print hoga yaha");
                    // // dynamic user=FirebaseAuth.instance.currentUser;
                    // // if(user != null)
                    // // id=user.uid;
                    // CollectionReference ref =
                    //     FirebaseFirestore.instance.collection("notes");
                    // // print(id);
                    // if (title1.text != "" && content1.text != "") {
                    //   widget.doctoedit.reference.update({
                    //     'title': title1.text,
                    //     'content': content1.text
                    //   }).whenComplete(() => Navigator.pop(context));
                    // } else
                    //   Navigator.pop(context);
                    widget.doctoedit.reference
                        .delete()
                        .whenComplete(() => Navigator.pop(context));
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Delete",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ))
            ]),
          ),
        ),
      ),
    ));
  }
}

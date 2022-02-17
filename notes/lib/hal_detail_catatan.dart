// import 'dart:html';
import 'package:flutter/material.dart';
import 'home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'hal_edit_catatan.dart';

class DetailCatatan extends StatelessWidget {
  // final ref = FirebaseFirestore.instance.collection('notes');
  final TextEditingController isi = TextEditingController();


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference notes = firestore.collection('notes');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[200],
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) =>
              //         EditNote(docToEdit: snapshot.data!.docs[index]),
              //   ),
              // );
            },
          ),
          IconButton(
            icon: new Icon(Icons.delete, color: Colors.blue),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text("Hapus catatan"),
                  content: Text("Yakin ingin menghapus catatan ini?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Tidak"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      child: Text("Ya"),
                    ),
                  ],
                  backgroundColor: Colors.blueGrey[200],
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {  
          return Column(
            children: [
                Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Stack(
               children: [
                 Text('ini adalah text')
               ],
              )
            ],
          );
        },
      ),
    );
  }
}

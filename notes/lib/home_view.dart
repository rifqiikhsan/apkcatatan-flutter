import 'dart:ffi';
import 'package:notes/hal_detail_catatan.dart';
import 'package:notes/tambah_catatan_baru.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'hal_edit_catatan.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  final ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey[200],
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.exit_to_app, color: Colors.blue),
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          );
        },
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.hasData ? snapshot.data?.docs.length : 0,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditNote(docToEdit: snapshot.data!.docs[index],),
                        ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 150,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Text(snapshot.data?.docs[index]['isi']),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

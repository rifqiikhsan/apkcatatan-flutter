import 'package:flutter/material.dart';
import 'package:notes/hal_edit_catatan.dart';
import 'package:notes/main.dart';
import 'home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DetailCatatan extends StatelessWidget {
  const DetailCatatan({Key? key}) : super(key: key);

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNotes(),
                ),
              );
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

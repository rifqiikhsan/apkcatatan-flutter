import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes/hal_detail_catatan.dart';
import 'package:notes/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddNote extends StatelessWidget {
  // const AddNote({Key? key}) : super(key: key);

final TextEditingController isi = TextEditingController();
final CollectionReference ref =
      FirebaseFirestore.instance.collection('notes');

    
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
            icon: new Icon(Icons.save, color: Colors.blue),
            onPressed: () {
              //aksi ketika tombol save di klik
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text("Simpan catatan"),
                  content: Text("Yakin ingin menyimpan catatan ini?"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Tidak"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.add({
                          'isi':isi.text,

                        });
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
              child: TextField(
                controller: isi,
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Silahkan Masukan Catatan disini....',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
 import 'package:notes/hal_detail_catatan.dart';
 import 'package:notes/home_view.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';

class EditNote extends StatefulWidget {

DocumentSnapshot docToEdit ;
EditNote({required this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  
 TextEditingController isi = TextEditingController();

@override
  void initState() {
    isi = TextEditingController(text: widget.docToEdit.get('isi'));
    super.initState();
  }

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
                        widget.docToEdit.reference.update({
                          'isi': isi,
                        }).whenComplete((){
                            Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (_) => HomePage()));
                        });
                      },
                      child: Text("Ya"),
                    ),
                  ],
                  backgroundColor: Colors.blueGrey[200],
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
                        widget.docToEdit.reference.delete().whenComplete((){
                          Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => HomePage()));
                        });
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
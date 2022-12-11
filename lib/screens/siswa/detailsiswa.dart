import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailSiswa extends StatefulWidget {
  List list;
  int index;
  DetailSiswa({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<DetailSiswa> {
  void deleteData() {
    var url = "http://192.168.43.194/data_mhs_ukm/deletedata.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['Pelajaran']}")),
      body: new Container(
        height: 350.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  "Pelajaran : ${widget.list[widget.index]['Pelajaran']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Pengajar : ${widget.list[widget.index]['Pengajar']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tanggal : ${widget.list[widget.index]['Tanggal']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Materi' : ${widget.list[widget.index]['Materi']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tugas : ${widget.list[widget.index]['Tugas']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Tenggat : ${widget.list[widget.index]['Tenggat']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Link : ${widget.list[widget.index]['Link']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

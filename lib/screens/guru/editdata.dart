import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_guru.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerPelajaran;
  late TextEditingController controllerPengajar;
  late TextEditingController controllerTanggal;
  late TextEditingController controllerMateri;
  late TextEditingController controllerTugas;
  late TextEditingController controllerTenggat;
  late TextEditingController controllerLink;

  void editData() {
    var url = Uri.parse("http://192.168.43.194/data_mhs_ukm/editdata.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "Pelajaran": controllerPelajaran.text,
      "Pengajar": controllerPengajar.text,
      "Tanggal": controllerTanggal.text,
      "Materi": controllerMateri.text,
      "Tugas": controllerTugas.text,
      "Tenggat": controllerTenggat.text,
      "Link": controllerLink.text
    });
  }

  @override
  void initState() {
    controllerPelajaran =
        new TextEditingController(text: widget.list[widget.index]['Pelajaran']);
    controllerPengajar =
        new TextEditingController(text: widget.list[widget.index]['Pengajar']);
    controllerTanggal =
        new TextEditingController(text: widget.list[widget.index]['Tanggal']);
    controllerMateri =
        new TextEditingController(text: widget.list[widget.index]['Materi']);
    controllerTugas =
        new TextEditingController(text: widget.list[widget.index]['Tugas']);
    controllerTenggat =
        new TextEditingController(text: widget.list[widget.index]['Tenggat']);
    controllerLink =
        new TextEditingController(text: widget.list[widget.index]['Link']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerPelajaran,
                  decoration: new InputDecoration(
                      hintText: "Pelajaran", labelText: "Pelajaran"),
                ),
                new TextField(
                  controller: controllerPengajar,
                  decoration: new InputDecoration(
                      hintText: "Pengajar", labelText: "Pengajar"),
                ),
                new TextField(
                  controller: controllerTanggal,
                  decoration: new InputDecoration(
                      hintText: "Tanggal", labelText: "Tanggal"),
                ),
                new TextField(
                  controller: controllerMateri,
                  decoration: new InputDecoration(
                      hintText: "Materi", labelText: "Materi"),
                ),
                new TextField(
                  controller: controllerTugas,
                  decoration: new InputDecoration(
                      hintText: "Tugas", labelText: "Tugas"),
                ),
                new TextField(
                  controller: controllerTenggat,
                  decoration: new InputDecoration(
                      hintText: "Tenggat", labelText: "Tenggat"),
                ),
                new TextField(
                  controller: controllerLink,
                  decoration:
                      new InputDecoration(hintText: "Link", labelText: "Link"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new MaterialButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new HomeGuru()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

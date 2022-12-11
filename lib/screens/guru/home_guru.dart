import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../add_data/adddata.dart';
import 'camera.dart';
import 'detail.dart';

// void main() {
//   runApp(new MaterialApp(
//     title: "Smart Class",
//     home: new Guru(),
//   ));
// }

class HomeGuru extends StatefulWidget {
  const HomeGuru({super.key});
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeGuru> {
  Future<List> getData() async {
    var url = Uri.parse("http://192.168.43.194/data_mhs_ukm/getdata.php");
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Smart Class"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeGuru()));
                  },
                  icon: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 2, 16, 41),
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const camera()));
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Color.fromARGB(255, 2, 16, 41),
                  )),
            ]),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data ?? [],
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 188, 217, 242),
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              width: double.infinity,
              color: Color.fromARGB(255, 109, 209, 245),
              child: Text(
                "Selamat Datang Di Aplikasi Smart Class",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color.fromARGB(255, 1, 45, 87),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 25),
              ),
            ),
            ListTile(
                onTap: () {},
                leading: Icon(Icons.people),
                title: Text("Profile")),
            ListTile(
                onTap: () {},
                leading: Icon(Icons.info),
                title: Text("Data Aplikasi")),
            ListTile(
                onTap: () {},
                leading: Icon(Icons.logout),
                title: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['Pelajaran']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Tenggat : ${list[i]['Tenggat']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

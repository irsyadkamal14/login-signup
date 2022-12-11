import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartclass/screens/siswa/home_siswa.dart';

class camerasiswa extends StatelessWidget {
  const camerasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kamera"),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomCamera(title: "Kamera", icon: Icons.camera, onClick: (() => {}))
        ]),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeSiswa()));
                  },
                  icon: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 2, 16, 41),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera,
                    color: Color.fromARGB(255, 2, 16, 41),
                  )),
            ]),
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

Widget CustomCamera({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
      height: 100,
      width: 200,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [Icon(icon), SizedBox(width: 50), Text(title)],
        ),
      ));
}

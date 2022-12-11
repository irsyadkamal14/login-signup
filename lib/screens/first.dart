import 'package:flutter/material.dart';
import 'package:smartclass/screens/signup-in/signin_guru.dart';

import 'package:smartclass/screens/signup-in/signin_siswa.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInSiswa()));
              },
              child: Container(
                width: 300,
                height: 150,
                margin: EdgeInsets.all(25),
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Guru",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInGuru()));
              },
              child: Container(
                width: 300,
                height: 150,
                margin: EdgeInsets.all(25),
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Siswa",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomAdd({
  required String title,
  required IconData icon,
  //required VoidCallback onClick,
}) {
  return Container(
      height: 150,
      width: 300,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [Icon(icon), SizedBox(width: 50), Text(title)],
        ),
      ));
}

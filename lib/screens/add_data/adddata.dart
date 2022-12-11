import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatelessWidget {
  const AddData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make and Join Class"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomAdd(
            title: " Join Class ",
            icon: Icons.library_add_check,
            onClick: () => {},
          ),
          CustomAdd(
              title: "Make Class",
              icon: Icons.my_library_books_rounded,
              onClick: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddData()))
                  }),
        ],
      )),
    );
  }
}

Widget CustomAdd({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
      height: 200,
      width: 200,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [Icon(icon), SizedBox(width: 50), Text(title)],
        ),
      ));
}

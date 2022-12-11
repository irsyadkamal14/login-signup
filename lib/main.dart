import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smartclass/screens/first.dart';
import 'package:smartclass/screens/signup-in/signin_siswa.dart';
import 'screens/signup-in/components/load.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

FirebaseAuth _auth = FirebaseAuth.instance;
Stream<User?> get streamAuthStatus => _auth.authStateChanges();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: First(),
      ),
    );
    // StreamBuilder<User?>(
    //   stream: streamAuthStatus,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       print(snapshot.data);
    //       return GetMaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         home: snapshot.data != null && snapshot.data!.emailVerified == true
    //             ? First()
    //             : SplashScreen(),
    //       );
    //     }
    //     return Loading();
    //   },
    // );
  }
}

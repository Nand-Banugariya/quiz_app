
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/SubjectSelectionPage.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/signup.dart';
import 'package:app/screens/SubjectSelectionPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBzZXJkt2Wq-JKKK7H0BEknm88l_DP_90s",
      appId: '1:682903562656:android:6dab4d7cef8b0e2918dcc5',
      messagingSenderId: '682903562656',
      projectId: 'database-879e3',
      // other configurations...
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Specify the initial route
      routes: {
        '/': (context) => LoginScreen(), // Set the initial route to LoginScreen
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
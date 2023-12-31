import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/widgets/colours.dart';
import 'package:whatsapp_clone/responsive/responsive_layout_screen.dart';
import 'package:whatsapp_clone/screens/mobilescreenlayout.dart';
import 'package:whatsapp_clone/screens/webscreenlayout.dart';
import 'package:whatsapp_clone/widgets/contact_list.dart';
import 'package:whatsapp_clone/widgets/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const ContactList()
    );
  }
}
//class responsive

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/colours.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Phone Number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'whatsapp will need to verify your phone number',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'pick country',
                style: TextStyle(color: Colors.blue),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('91+',style: TextStyle(color: Colors.white),),
              const SizedBox(
                width: 2,
                child: TextField(),
              ),

            ],
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../controller/userController.dart';

class SignupView extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _signup(String email, String pass) async {
    print(email);
    print(pass);
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );
        UserProfile user = UserProfile(
          displayName: userCredential.user!.uid, // Set user's display name here
        );

        await _firestore.collection('users').doc(userCredential.user?.uid).set({
          'name': _nameController.text,
        });

        // You can handle the successful signup here, e.g., navigate to the home page.
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        } else {
          print('Error: ${e.message}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                centerTitle: true,
              ),
              Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Image.asset(
                    "assets/images/Burger.png",
                    height: 180.0,
                  )),
              const Text(
                "Create a new account",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 20.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter your Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an name';
                      }
                      // if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      //   return 'Please a valid Email';
                      // }
                      return null;
                    },
                    onSaved: (value) {
                      _emailController.text = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email id"),
                      ])),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // _passwordController.text = value!;
                    },
                    //validatePassword,
                    //validatePassword,        //Function to check validation
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 30.0, right: 20.0),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
                  child: TextFormField(
                    controller: _repasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'confirm Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(_passwordController.text);
                      print(_repasswordController.text);
                      if (_passwordController.text !=
                          _repasswordController.text) {
                        print("saved");
                        return "Password does not match";
                      }

                      return null;
                    },

                    onSaved: (value) {
                      _repasswordController.text = value!;
                    },
                    //validatePassword,
                    //validatePassword,        //Function to check validation
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                // width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      print("---------");
                      print(_emailController.text);
                      print(_passwordController.text);
                      print("--------------");
                      _signup(_emailController.text,
                          _passwordController.text);
                      _showSnackbar(context);
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(fontSize: 18.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Account sucessfully screated '),
      duration:
          Duration(seconds: 3), // Duration for which the Snackbar is displayed
      action: SnackBarAction(
        label: 'CLOSE',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

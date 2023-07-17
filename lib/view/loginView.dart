



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webkul_task/view/homeView.dart';
import 'package:webkul_task/view/productView.dart';
import 'package:webkul_task/view/signupView.dart';


class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User?user;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 Future<User?> _login(String email,String pass,context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );
        user= userCredential.user;
        print("aisha");
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView()));

        print('login');

        // You can handle the successful login here, e.g., navigate to the home page.
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
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
             Container(
               margin: EdgeInsets.only(

                 top: 50.0
               ),
                 child: Image.asset(
                     "assets/images/Burger.png",
                 height: 180.0,)),
              Text("Welcome Back !",
              style: TextStyle(
                  fontSize: 30.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.only(left: 30.0,right: 20.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    onSaved: (value) {
                      _emailController.text = value!;
                    },
                  ),
                  ),
                ),

              SizedBox(height: 10.0,),
              Container(
                margin: EdgeInsets.only(left: 30.0,right: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: _passwordController,
                      obscureText: true,
                      decoration:const InputDecoration(
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
                      _passwordController.text = value!;
                    },
                  ),
                    //validatePassword,        //Function to check validation
                  ),

                ),

              SizedBox(height:20.0,),
              Container(

                padding:const  EdgeInsets.only(left:40.0,right: 40.0),
                // width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: (){
                      _login(_emailController.text,
                          _passwordController.text,context);


                    },
                    child: Text("Login",
                    style: TextStyle(fontSize: 18.0),)),
              ),
              SizedBox(height: 40.0,),
              Container(
                  child: Center(
                    child: Row(
                      children: [

                        Container(
                          margin: EdgeInsets.only(left: 80.0),
                            child: Text("Don't have a account ? ")),
                        SizedBox(height: 40.0,),

                        Padding(
                          padding: const EdgeInsets.only(left:1.0),
                          child: InkWell(
                              onTap: (){

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignupView()),
                                );
                              },
                              child: Text('Signup', style: TextStyle(fontSize: 18, color: Colors.green,)),
                        )
                        ) ],
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );


  }
}
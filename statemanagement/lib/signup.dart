import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/hello.dart';
import 'package:statemanagement/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(children: [
            const Text("Sign Up",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 50,
            ),
            Consumer<CartProvider>(builder:
                (BuildContext context, CartProvider value, Widget? child) {
              return Column(
                children: [
                  TextField(
                    controller: value.nameController,
                    decoration: InputDecoration(
                        hintText: "First and Last Name",
                        label: Text("Name"),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: value.emailController,
                    decoration: InputDecoration(
                        hintText: "youremail@gmail.com",
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: value.numberController,
                    decoration: InputDecoration(
                        hintText: "01*********",
                        label: Text("Phone Number"),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: value.passwordController,
                    decoration: InputDecoration(
                        hintText: "your password",
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: value.imageController,
                    decoration: InputDecoration(
                        hintText: "image url",
                        label: Text("Image URL"),
                        prefixIcon: Icon(Icons.image),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(300, 60)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xffff0000))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Hello()));
                      },
                      child:
                          const Text("Sign Up", style: TextStyle(fontSize: 28)))
                ],
              );
            })
          ]),
        )),
      ),
    ));
  }
}

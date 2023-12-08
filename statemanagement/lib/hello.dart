import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:statemanagement/cart.dart';
import 'package:statemanagement/provider.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  CartProvider value = CartProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 85,
          title: Row(
            children: [
              Consumer<CartProvider>(
                builder:
                    (BuildContext context, CartProvider value, Widget? child) {
                  return CircleAvatar(
                    backgroundImage:
                        NetworkImage("${value.imageController.text}"),
                    radius: 30,
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Consumer<CartProvider>(
                builder:
                    (BuildContext context, CartProvider value, Widget? child) {
                  return Text(
                    'Hi, ${value.nameController.text}',
                    style: const TextStyle(color: Colors.black),
                  );
                },
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Stack(alignment: Alignment.topRight, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0, left: 6.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 11,
                      child: Consumer<CartProvider>(
                        builder: (BuildContext context, CartProvider value,
                            Widget? child) {
                          return Text(
                            "${value.cart}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      )),
                ),
              ]),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const Image(
                image: NetworkImage(
                    "https://th.bing.com/th/id/R.e3dce92bfd3d1e79bf76a0b889044248?rik=WH2ErT82a4o%2bWQ&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f7%2fChair-PNG-Picture.png&ehk=hUcfxz105jzFMctknIioVFf5WXs0nSzG%2fDNqt14N28s%3d&risl=&pid=ImgRaw&r=0"),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<CartProvider>(
                        builder: (BuildContext context, CartProvider value,
                            Widget? child) {
                          return Text(
                            "Welcome, ${value.nameController.text}!",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      Consumer<CartProvider>(
                        builder: (BuildContext context, CartProvider value,
                            Widget? child) {
                          return Text(
                              "Your Email is ${value.emailController.text}",
                              style: const TextStyle(fontSize: 18));
                        },
                      ),
                      Consumer<CartProvider>(
                        builder: (BuildContext context, CartProvider value,
                            Widget? child) {
                          return Text(
                              "Your phone number is ${value.numberController.text}",
                              style: TextStyle(fontSize: 18));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2),
                    ),
                    child: Consumer<CartProvider>(
                      builder: (BuildContext context, CartProvider value,
                          Widget? child) {
                        return IconButton(
                            onPressed: () {
                              value.decCart();
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 30,
                              color: Colors.black,
                            ));
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Consumer<CartProvider>(
                    builder: (BuildContext context, CartProvider value,
                        Widget? child) {
                      return Text(
                        "${value.cart}",
                        style: TextStyle(fontSize: 30),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2),
                    ),
                    child: Consumer<CartProvider>(
                      builder: (BuildContext context, CartProvider value,
                          Widget? child) {
                        return IconButton(
                            onPressed: () {
                              value.incCart();
                            },
                            icon: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.black,
                            ));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffff0000)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.shopping_cart),
                        Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

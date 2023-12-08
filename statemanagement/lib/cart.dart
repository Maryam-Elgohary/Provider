import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.e3dce92bfd3d1e79bf76a0b889044248?rik=WH2ErT82a4o%2bWQ&riu=http%3a%2f%2fwww.pngmart.com%2ffiles%2f7%2fChair-PNG-Picture.png&ehk=hUcfxz105jzFMctknIioVFf5WXs0nSzG%2fDNqt14N28s%3d&risl=&pid=ImgRaw&r=0")),
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
                  )),
              SizedBox(
                width: 20,
              ),
              Consumer<CartProvider>(
                builder:
                    (BuildContext context, CartProvider value, Widget? child) {
                  return Text(
                    "${value.cart}",
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
              SizedBox(
                width: 20,
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
                  )),
            ],
          ),
        ],
      )),
    );
  }
}

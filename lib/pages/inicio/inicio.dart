import 'package:flutter/material.dart';

// ignore: camel_case_types
class inicio extends StatelessWidget {
  const inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'EMPRESA SNKRS',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Bienvenido !!!! ',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Nuestro Telefono : XXXXXXXX',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Correo: correo@gmail.com ',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'WhatsApp : 999666999 ',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ));
  }
}

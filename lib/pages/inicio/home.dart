import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:appflutter/models/producto_model.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';
import 'package:appflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/pages/cliente/cliente_list.dart';
import 'package:appflutter/pages/producto/producto_list.dart';
import 'package:appflutter/pages/proveedor/proveedor_list.dart';
import 'package:appflutter/pages/orden/orden_list.dart';
import 'package:appflutter/pages/inicio/home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  // HomeState2 createState2() => HomeState2();
}
/* 
class HomeState extends State<Home> {
  int _selectDrawerItem = 0;
  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Home();
      case 1:
        return const ClientesList();
      case 2:
        return const ProductosList();
      case 3:
        return const ProveedoresList();
      case 4:
        return const OrdenList();
    }
  }
} */

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCEDDEE),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(
              title: "Clientes",
              icon: Icons.account_circle_rounded,
              warna: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/list-cliente",
            ),
            MyMenu(
              title: "Productos ",
              icon: Icons.list_alt,
              warna: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/list-producto",
            ),
            MyMenu(
              title: "Proveedores",
              icon: Icons.add_business_sharp,
              warna: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/list-proveedor",
            ),
            MyMenu(
              title: "Orden de compra",
              icon: Icons.account_balance_wallet,
              warna: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/list-orden",
            ),
            MyMenu(
              title: "Gestion de Clientes",
              icon: Icons.manage_accounts_sharp,
              warna: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/list-cliente",
            ),
            MyMenu(
              title: "Gestion de Ventas",
              icon: Icons.sell,
              warna: Color.fromARGB(255, 39, 32, 32),
              borderRadius: BorderRadius.circular(10),
              boxShadow: BoxShadow(
                color: Color(0xFFF5F9FD).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
              routes: "/",
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.borderRadius,
      required this.boxShadow,
      required this.routes});

  final String title;
  final IconData icon;
  final Color warna;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [boxShadow],
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, routes);
            },
            splashColor: Color(0xFFCEDDEE),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 55.0,
                    color: warna,
                  ),
                  Text(
                    title,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

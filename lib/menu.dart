// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'dart:io';

import 'package:appflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/pages/cliente/cliente_list.dart';
import 'package:appflutter/pages/producto/producto_list.dart';
import 'package:appflutter/pages/proveedor/proveedor_list.dart';
import 'package:appflutter/pages/orden/orden_list.dart';
import 'package:appflutter/pages/inicio/home.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
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

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SNKRS"),
        backgroundColor: Color(0xFF475269),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF475269)),
              accountName: Text('SNKRS'),
              accountEmail: Text('zapatilla@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logoxyz.png'),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              leading: const Icon(Icons.home),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Clientes'),
              leading: const Icon(Icons.person),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: const Text('Productos'),
              leading: const Icon(Icons.wind_power_rounded),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: const Text('Proveedores'),
              leading: const Icon(Icons.local_shipping),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            ListTile(
              title: const Text('Orden de compra'),
              leading: const Icon(Icons.article),
              selected: (4 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(4);
              },
            ),
            ListTile(
              title: const Text('Ventas'),
              leading: const Icon(Icons.production_quantity_limits),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Cerra Sessión'),
              leading: const Icon(Icons.touch_app_outlined),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
      body: getDrawerItemWidget(_selectDrawerItem),
    );
  }
}

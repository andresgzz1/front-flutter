import 'dart:convert';
import 'package:appflutter/pages/inicio/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appflutter/usuario.dart';
import 'package:appflutter/menu.dart';
import 'package:appflutter/pages/cliente/cliente_add_edit.dart';
import 'package:appflutter/pages/cliente/cliente_list.dart';
import 'package:appflutter/pages/orden/orden_add_edit.dart';
import 'package:appflutter/pages/orden/orden_list.dart';
import 'package:appflutter/pages/producto/producto_add_edit.dart';
import 'package:appflutter/pages/producto/producto_list.dart';
import 'package:appflutter/pages/proveedor/proveedor_add_edit.dart';
import 'package:appflutter/pages/proveedor/proveedor_list.dart';
import 'package:appflutter/config.dart';
import 'package:appflutter/pages/inicio/inicio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: const Scaffold(
          appBar: null,
          body: MyStatefulWidget(),
        ),
        routes: {
          '/list-cliente': (context) => const ClientesList(),
          '/add-cliente': (context) => const ClienteAddEdit(),
          '/edit-cliente': (context) => const ClienteAddEdit(),
          '/list-producto': (context) => const ProductosList(),
          '/add-producto': (context) => const ProductoAddEdit(),
          '/edit-producto': (context) => const ProductoAddEdit(),
          '/list-orden': (context) => const OrdenList(),
          '/add-orden': (context) => const OrdenAddEdit(),
          '/edit-orden': (context) => const OrdenAddEdit(),
          '/list-proveedor': (context) => const ProveedoresList(),
          '/add-proveedor': (context) => const ProveedorAddEdit(),
          '/edit-proveedor': (context) => const ProveedorAddEdit(),
          '/home': (context) => Menu(),
        });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //final urllogin = Uri.parse("http://192.168.1.108/api/login/");
  final urllogin = Uri.http(Config.apiURL, Config.loginAPI);

  //final urlobtenertoken = Uri.parse("http://192.168.1.108/api/api-token-auth/");
  final urlobtenertoken = Uri.http(Config.apiURL, Config.obtenertokenAPI);
  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 189, 211, 233),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          Container(
            height: 175,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 55,
            decoration: BoxDecoration(
                color: Color(0xFFF5F9FD),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1, //opacar el rectangulo
                  )
                ]),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 27,
                  color: Color(0xFF475269),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  // margin: EdgeInsets.,
                  width: 250,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "ingrese su nombre"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 55,
            decoration: BoxDecoration(
                color: Color(0xFFF5F9FD),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1, //opacar el rectangulo
                  )
                ]),
            child: Row(
              children: [
                Icon(
                  Icons.lock,
                  size: 27,
                  color: Color(0xFF475269),
                ),
                SizedBox(width: 10),
                Container(
                  // margin: EdgeInsets.,
                  width: 250,
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ingrese su contraseña"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Olvidaste tu contraseña ?",
                style: TextStyle(
                  color: Color(0xFFF475269),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          InkWell(
            onTap: () {
              login();
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF475269),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF475269).withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No tienes una cuenta ?",
                style: TextStyle(
                  color: Color(0xFF475269).withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Ingresar sesion",
                  style: TextStyle(
                    color: Color(0xFF475269),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ))),
    );
  }

  void showSnackbar(String msg) {
    final snack = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<void> login() async {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackbar(
          "${nameController.text.isEmpty ? "-User " : ""} ${passwordController.text.isEmpty ? "- Contraseña " : ""} requerido");
      return;
    }
    final datosdelposibleusuario = {
      "username": nameController.text,
      "password": passwordController.text
    };
    final res = await http.post(urllogin,
        headers: headers, body: jsonEncode(datosdelposibleusuario));
    //final data = Map.from(jsonDecode(res.body));
    if (res.statusCode == 400) {
      showSnackbar("error");
      return;
    }
    if (res.statusCode != 200) {
      showSnackbar("Ups ha habido un al obtener usuario y contraseña ");
    }
    final res2 = await http.post(urlobtenertoken,
        headers: headers, body: jsonEncode(datosdelposibleusuario));
    final data2 = Map.from(jsonDecode(res2.body));
    if (res2.statusCode == 400) {
      showSnackbar("error");
      return;
    }
    if (res2.statusCode != 200) {
      showSnackbar("Ups ha habido al obtener el token ");
    }
    final token = data2["token"];
    final user = Usuario(
        username: nameController.text,
        password: passwordController.text,
        token: token);
    // ignore: use_build_context_synchronously
    //Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(
      context,
      '/home',
    );
  }
}
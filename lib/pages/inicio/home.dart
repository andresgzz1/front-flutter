import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
            ),
            MyMenu(
              title: "Productos y Insumos",
              icon: Icons.list_alt,
              warna: Colors.black,
            ),
            MyMenu(
              title: "Proveedores",
              icon: Icons.add_business_sharp,
              warna: Colors.black,
            ),
            MyMenu(
              title: "Ordenes de compra",
              icon: Icons.account_balance_wallet,
              warna: Colors.black,
            ),
            MyMenu(
              title: "Gestion de Clientes",
              icon: Icons.manage_accounts_sharp,
              warna: Colors.black,
            ),
            MyMenu(
              title: "Gestion de Ventas",
              icon: Icons.sell,
              warna: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({required this.title, required this.icon, required this.warna});

  final String title;
  final IconData icon;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Color(0xFFCEDDEE),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 15.0))
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {

//     // return Scaffold(
//     //   backgroundColor: Color(0xFFCEDDEE),
//     //   body: Container(
//     //     padding: EdgeInsets.all(30.0),
//     //     child: GridView.count(
//     //       crossAxisCount: 2,
//     //       children: <Widget>[
//     //         MyMenu(
//     //           title: "Clientes",
//     //           icon: Icons.account_circle_rounded,
//     //           warna: Colors.black,
//     //           borderRadius: BorderRadius.circular(10),
//     //           boxShadow: BoxShadow(
//     //             color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //             spreadRadius: 5,
//     //             blurRadius: 1,
//     //             offset: Offset(0, 3),
//     //           ),
//     //         ),
//     //         MyMenu(
//     //             title: "Productos ",
//     //             icon: Icons.list_alt,
//     //             warna: Colors.black,
//     //             borderRadius: BorderRadius.circular(10),
//     //             boxShadow: BoxShadow(
//     //               color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //               spreadRadius: 5,
//     //               blurRadius: 1,
//     //               offset: Offset(0, 3),
//     //             )),
//     //         MyMenu(
//     //             title: "Proveedores",
//     //             icon: Icons.add_business_sharp,
//     //             warna: Colors.black,
//     //             borderRadius: BorderRadius.circular(10),
//     //             boxShadow: BoxShadow(
//     //               color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //               spreadRadius: 5,
//     //               blurRadius: 1,
//     //               offset: Offset(0, 3),
//     //             )),
//     //         MyMenu(
//     //             title: "Orden de compra",
//     //             icon: Icons.account_balance_wallet,
//     //             warna: Colors.black,
//     //             borderRadius: BorderRadius.circular(10),
//     //             boxShadow: BoxShadow(
//     //               color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //               spreadRadius: 5,
//     //               blurRadius: 1,
//     //               offset: Offset(0, 3),
//     //             )),
//     //         MyMenu(
//     //             title: "Gestion de Clientes",
//     //             icon: Icons.manage_accounts_sharp,
//     //             warna: Colors.black,
//     //             borderRadius: BorderRadius.circular(10),
//     //             boxShadow: BoxShadow(
//     //               color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //               spreadRadius: 5,
//     //               blurRadius: 1,
//     //               offset: Offset(0, 3),
//     //             )),
//     //         MyMenu(
//     //             title: "Gestion de Ventas",
//     //             icon: Icons.sell,
//     //             warna: Color.fromARGB(255, 39, 32, 32),
//     //             borderRadius: BorderRadius.circular(10),
//     //             boxShadow: BoxShadow(
//     //               color: Color(0xFFF5F9FD).withOpacity(0.3),
//     //               spreadRadius: 5,
//     //               blurRadius: 1,
//     //               offset: Offset(0, 3),
//     //             )),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }

// class MyMenu extends StatelessWidget {
//   MyMenu({
//     required this.title,
//     required this.icon,
//     required this.warna,
//     required this.borderRadius,
//     required this.boxShadow,
//   });

//   final String title;
//   final IconData icon;
//   final Color warna;
//   final BorderRadius borderRadius;
//   final BoxShadow boxShadow;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: borderRadius,
//       ),
//       child: Container(
//           decoration: BoxDecoration(
//             borderRadius: borderRadius,
//             boxShadow: [boxShadow],
//           ),
//           child: InkWell(
//             onTap: () {},
//             splashColor: Color(0xFFCEDDEE),
//             child: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Icon(
//                     icon,
//                     size: 55.0,
//                     color: warna,
//                   ),
//                   Text(
//                     title,
//                     style: new TextStyle(
//                         fontWeight: FontWeight.w500, fontSize: 14.0),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }

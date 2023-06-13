import 'package:flutter/material.dart';
import 'package:appflutter/models/cliente_model.dart';
import 'package:appflutter/pages/cliente/cliente_item.dart';
import 'package:appflutter/services/api_cliente.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ClientesList extends StatefulWidget {
  const ClientesList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClientesListState createState() => _ClientesListState();
}

class _ClientesListState extends State<ClientesList> {
  // List<ClienteModel> clientes = List<ClienteModel>.empty(growable: true);
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text('NodeJS - CRUD'),
        elevation: 0,
      ),*/
      backgroundColor: Color(0xFFCEDDEE),
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
        child: loadClientes(),
      ),
    );
  }

  Widget loadClientes() {
    return FutureBuilder(
      future: APICliente.getClientes(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ClienteModel>?> model,
      ) {
        if (model.hasData) {
          return clienteList(model.data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget clienteList(clientes) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                // ignore: sort_child_properties_last
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/home',
                        );
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF475269),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text('Menu',
                          style: TextStyle(
                              fontSize: 17, color: Color(0xFFF5F9FD)))),
                  SizedBox(height: 5),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/add-cliente',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF475269),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Añadir Cliente',
                        style:
                            TextStyle(fontSize: 17, color: Color(0xFFF5F9FD)),
                      )),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F9FD),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF475269).withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          // margin : EdgeInsets.only(left: 5),
                          width: 75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Buscar",
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xFF475269),
                        ),
                      ],
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

              //   child: const Text('Add Cliente'),
              //Navigator.pushNamed(context,'/add-cliente',);
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  return ClienteItem(
                    model: clientes[index],
                    onDelete: (ClienteModel model) {
                      setState(() {
                        isApiCallProcess = true;
                      });

                      APICliente.deleteCliente(model.id).then(
                        (response) {
                          setState(() {
                            isApiCallProcess = false;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

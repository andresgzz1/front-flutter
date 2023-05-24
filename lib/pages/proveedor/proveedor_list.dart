import 'package:flutter/material.dart';
import 'package:appflutter/models/proveedor_model.dart';
import 'package:appflutter/pages/proveedor/proveedor_item.dart';
import 'package:appflutter/services/api_proveedor.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ProveedoresList extends StatefulWidget {
  const ProveedoresList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProveedoresListState createState() => _ProveedoresListState();
}

class _ProveedoresListState extends State<ProveedoresList> {
  // List<ProductModel> products = List<ProductModel>.empty(growable: true);
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
        title: const Text('Django - CRUD'),
        elevation: 0,
      ),*/
      backgroundColor: Colors.grey[200],
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
        child: loadProveedores(),
      ),
    );
  }

  Widget loadProveedores() {
    return FutureBuilder(
      future: APIProveedor.getProveedores(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ProveedorModel>?> model,
      ) {
        if (model.hasData) {
          return proveedorList(model.data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget proveedorList(proveedores) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                // ignore: sort_child_properties_last
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/add-proveedor',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Add Proveedor',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/home',
                        );
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Menu',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),

              //Navigator.pushNamed(context,'/add-product',);
              //Add Product
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: proveedores.length,
                itemBuilder: (context, index) {
                  return ProveedorItem(
                    model: proveedores[index],
                    onDelete: (ProveedorModel model) {
                      setState(() {
                        isApiCallProcess = true;
                      });

                      APIProveedor.deleteProveedor(model.id).then(
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

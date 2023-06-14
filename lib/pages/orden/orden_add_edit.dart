import 'dart:io';

import 'package:flutter/material.dart';
import 'package:appflutter/models/orden_model.dart';
import 'package:appflutter/services/api_orden.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../config.dart';

class OrdenAddEdit extends StatefulWidget {
  const OrdenAddEdit({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrdenAddEditState createState() => _OrdenAddEditState();
}

class _OrdenAddEditState extends State<OrdenAddEdit> {
  OrdenModel? ordenModel;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  List<Object> images = [];
  bool isEditMode = false;
  bool isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orden de compra'),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[200],
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: ordenForm(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ordenModel = OrdenModel();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        ordenModel = arguments['model'];
        isEditMode = true;
        setState(() {});
      }
    });
  }

  Widget ordenForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              //const Icon(Icons.person),
              "ordenName",
              "ID Orden",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'El nombre de la orden no puede ser vacio o nulo';
                }

                return null;
              },
              (onSavedVal) => {
                ordenModel!.ordenName = onSavedVal,
              },
              initialValue: ordenModel!.ordenName ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              //const Icon(Icons.person),
              "ordenDescription",
              "Descripción",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'La descripcion no puede ser nula';
                }

                return null;
              },
              (onSavedVal) => {
                ordenModel!.ordenDescription = onSavedVal,
              },
              initialValue: ordenModel!.ordenDescription ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              //const Icon(Icons.person),
              "ordenModelo",
              "Modelo",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'El Modelo de la orden no puede ser vacio o nulo';
                }

                return null;
              },
              (onSavedVal) => {
                ordenModel!.ordenModelo = onSavedVal,
              },
              initialValue: ordenModel!.ordenModelo ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              //const Icon(Icons.person),
              "ordenCantidad",
              "Cantidad",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'La cantidad no puede ser vacío o nulo';
                }
                double? value = double.tryParse(onValidateVal);
                if (value == null) {
                  return 'Insertar un número válido con dos decimales';
                }
                if (value <= 0) {
                  return 'La cantidad debe ser mayor a 0';
                }

                return null;
              },
              (onSavedVal) => {
                ordenModel!.ordenCantidad = onSavedVal,
              },
              initialValue: ordenModel!.ordenCantidad ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.person),
              "ordenPrice",
              "Precio",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'El precio no puede estar vacío o nulo';
                }
                double? value = double.tryParse(onValidateVal);
                if (value == null) {
                  return 'Insertar un número válido con dos decimales';
                }
                if (value <= 0) {
                  return 'El precio debe ser mayor a 0';
                }

                return null;
              },
              (onSavedVal) => {
                //productModel!.productoPrice = int.parse(onSavedVal),
                ordenModel!.ordenPrice = onSavedVal,
              },
              initialValue: ordenModel!.ordenPrice == null
                  ? ""
                  : ordenModel!.ordenPrice.toString(),
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
              suffixIcon: const Icon(Icons.monetization_on),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              //const Icon(Icons.person),
              "ordenTalla",
              "Talla",
              (onValidateVal) {
                if (onValidateVal == null || onValidateVal.isEmpty) {
                  return 'La talla no puede estar vacía';
                }
                double? value = double.tryParse(onValidateVal);
                if (value == null) {
                  return 'Insertar un número válido con dos cifras';
                }
                if (value < 27 || value > 47) {
                  return 'La talla debe estar entre 27 y 47';
                }

                return null;
              },
              (onSavedVal) => {
                ordenModel!.ordenTalla = onSavedVal,
              },
              initialValue: ordenModel!.ordenTalla == null
                  ? ""
                  : ordenModel!.ordenTalla.toString(),
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          picPicker(
            isImageSelected,
            ordenModel!.ordenImage ?? "",
            (file) => {
              setState(
                () {
                  //model.productPic = file.path;
                  ordenModel!.ordenImage = file.path;
                  isImageSelected = true;
                },
              )
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Save",
              () {
                if (validateAndSave()) {
                  //print(productoModel!.toJson());

                  setState(() {
                    isApiCallProcess = true;
                  });

                  APIOrden.saveOrden(
                    ordenModel!,
                    isEditMode,
                    isImageSelected,
                  ).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/list-orden',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "ocurre un error, por favor verificar",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: HexColor("283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  static Widget picPicker(
    bool isImageSelected,
    String fileName,
    Function onFilePicked,
  ) {
    Future<XFile?> imageFile;
    ImagePicker picker = ImagePicker();

    return Column(
      children: [
        fileName.isNotEmpty
            ? isImageSelected
                ? Image.file(
                    File(fileName),
                    width: 300,
                    height: 300,
                  )
                : SizedBox(
                    child: Image.network(
                      fileName,
                      width: 200,
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                  )
            : SizedBox(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.scaleDown,
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.image, size: 35.0),
                onPressed: () {
                  imageFile = picker.pickImage(source: ImageSource.gallery);
                  imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                icon: const Icon(Icons.camera, size: 35.0),
                onPressed: () {
                  imageFile = picker.pickImage(source: ImageSource.camera);
                  imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  isValidURL(url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}

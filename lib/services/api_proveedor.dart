import 'package:flutter/foundation.dart';
import 'package:appflutter/models/proveedor_model.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class APIProveedor {
  static var client = http.Client();

  static Future<List<ProveedorModel>?> getProveedores() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.proveedoresAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return compute(proveedoresFromJson, response.body);

      //return true;
    } else {
      return null;
    }
  }

  static Future<bool> saveProveedor(
    ProveedorModel model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var productURL = "${Config.proveedoresAPI}/";

    if (isEditMode) {
      productURL = "$productURL${model.id.toString()}/";
    }

    var url = Uri.http(Config.apiURL, productURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    /*Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "token 6c7e9f684c68adf057008ce8a0f4dc11fae3c0d4",
    };*/

    var request = http.MultipartRequest(requestMethod, url);
    request.fields["proveedorName"] = model.proveedorName!;
    request.fields["proveedorPrice"] =
        double.parse(model.proveedorPrice!).toStringAsFixed(2);
    //request.headers["Authorization"] = "token 6c7e9f684c68adf057008ce8a0f4dc11fae3c0d4";

    if (model.proveedorImage != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'proveedorImage',
        model.proveedorImage!,
      );

      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteProveedor(productId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, "${Config.proveedoresAPI}/$productId/");

    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

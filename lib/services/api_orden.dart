import 'package:flutter/foundation.dart';
import 'package:appflutter/models/orden_model.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class APIOrden {
  static var client = http.Client();

  static Future<List<OrdenModel>?> getOrden() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.ordenAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return compute(ordenFromJson, response.body);
      //return true;
    } else {
      return null;
    }
  }

  static Future<bool> saveOrden(
    OrdenModel model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var productURL = "${Config.ordenAPI}/";

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
    request.fields["ordenName"] = model.ordenName!;
    request.fields["ordenDescription"] = model.ordenDescription!;
    request.fields["ordenCantidad"] =
        double.parse(model.ordenCantidad!).toStringAsFixed(2);
    request.fields["ordenPrice"] =
        double.parse(model.ordenPrice!).toStringAsFixed(2);
    request.fields["ordenModelo"] = model.ordenModelo!;
    request.fields["ordenTalla"] = model.ordenTalla!;
    //request.headers["Authorization"] = "token 6c7e9f684c68adf057008ce8a0f4dc11fae3c0d4";

    if (model.ordenImage != null && isFileSelected) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'ordenImage',
        model.ordenImage!,
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

  static Future<bool> deleteOrden(ordenId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, "${Config.ordenAPI}/$ordenId/");

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

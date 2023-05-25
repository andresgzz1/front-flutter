import 'dart:convert';

List<ProductoModel> productosFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ProductoModel>((json) => ProductoModel.fromJson(json))
      .toList();
}

class ProductoModel {
  late int? id;
  late String? productoName;
  late String? productoDescription;
  late String? productoPrice;
  late String? productoModelo;
  late String? productoTalla;
  late String? productoImage;

  ProductoModel({
    this.id,
    this.productoName,
    this.productoDescription,
    this.productoPrice,
    this.productoModelo,
    this.productoTalla,
    this.productoImage,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      id: json['id'] as int,
      productoName: json['productoName'] as String,
      productoDescription: json['productoDescription'],
      productoPrice: json['productoPrice'],
      productoModelo: json['productoModelo'] as String,
      productoTalla: json['productoTalla'],
      productoImage: json['productoImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['productoName'] = productoName;
    data['productoDescription'] = productoDescription;
    data['productoPrice'] = productoPrice;
    data['productoModelo'] = productoModelo;
    data['productoTalla'] = productoTalla;
    data['productoImage'] = productoImage;
    return data;
  }
}

//fa
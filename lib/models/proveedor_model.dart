import 'dart:convert';

List<ProveedorModel> proveedoresFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ProveedorModel>((json) => ProveedorModel.fromJson(json))
      .toList();
}

class ProveedorModel {
  late int? id;
  late String? proveedorName;
  late String? proveedorDescription;
  late String? proveedorPrice;
  late String? proveedorImage;

  ProveedorModel({
    this.id,
    this.proveedorName,
    this.proveedorDescription,
    this.proveedorPrice,
    this.proveedorImage,
  });

  factory ProveedorModel.fromJson(Map<String, dynamic> json) {
    return ProveedorModel(
      id: json['id'] as int,
      proveedorName: json['proveedorName'] as String,
      proveedorDescription: json['proveedorDescription'],
      proveedorPrice: json['proveedorPrice'],
      proveedorImage: json['proveedorImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['proveedorName'] = proveedorName;
    data['proveedorDescription'] = proveedorDescription;
    data['proveedorPrice'] = proveedorPrice;
    data['proveedorImage'] = proveedorImage;
    return data;
  }
}

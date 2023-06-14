import 'dart:convert';

List<OrdenModel> ordenFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<OrdenModel>((json) => OrdenModel.fromJson(json)).toList();
}

class OrdenModel {
  late int? id;
  late String? ordenName;
  late String? ordenDescription;
  late String? ordenCantidad;
  late String? ordenPrice;
  late String? ordenModelo;
  late String? ordenTalla;
  late String? ordenImage;

  OrdenModel({
    this.id,
    this.ordenName,
    this.ordenDescription,
    this.ordenCantidad,
    this.ordenPrice,
    this.ordenModelo,
    this.ordenTalla,
    this.ordenImage,
  });

  factory OrdenModel.fromJson(Map<String, dynamic> json) {
    return OrdenModel(
      id: json['id'] as int,
      ordenName: json['ordenName'] as String,
      ordenDescription: json['ordenDescription'] as String,
      ordenCantidad: json['ordenCantidad'],
      ordenPrice: json['ordenPrice'],
      ordenModelo: json['ordenModelo'] as String,
      ordenTalla: json['ordenTalla'],
      ordenImage: json['ordenImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['ordenName'] = ordenName;
    data['ordenDescription'] = ordenDescription;
    data['ordenCantidad'] = ordenCantidad;
    data['ordenPrice'] = ordenPrice;
    data['ordenModelo'] = ordenModelo;
    data['ordenTalla'] = ordenTalla;
    data['ordenImage'] = ordenImage;
    return data;
  }
}

//fa
//ga
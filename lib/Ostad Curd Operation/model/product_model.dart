class ProductModel {
  final String? status;
  final List<ProductData>? data;

  ProductModel({this.status, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'],
      data: json['data'] != null
          ? List<ProductData>.from(json['data'].map((x) => ProductData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data?.map((x) => x.toJson()).toList(),
  };
}

class ProductData {
  final String? id;
  final String? productName;
  final int? productCode;
  final String? img;
  final int? qty;
  final int? unitPrice;
  final int? totalPrice;

  ProductData({
    this.id,
    this.productName,
    this.productCode,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    id: json['_id'],
    productName: json['ProductName'],
    productCode: json['ProductCode'],
    img: json['Img'],
    qty: json['Qty'],
    unitPrice: json['UnitPrice'],
    totalPrice: json['TotalPrice'],
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'ProductName': productName,
    'ProductCode': productCode,
    'Img': img,
    'Qty': qty,
    'UnitPrice': unitPrice,
    'TotalPrice': totalPrice,
  };
}

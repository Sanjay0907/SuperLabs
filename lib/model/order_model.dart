// ignore_for_file: public_member_api_docs, sort_constructors_first

class OrderModel {
  String? name;
  String? sex;
  int? age;
  int? orderNo;
  int? charges;

  OrderModel({
    required this.name,
    required this.sex,
    required this.age,
    required this.orderNo,
    required this.charges,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      name: map['name'] != null ? map['name'] as String : null,
      sex: map['sex'] != null ? map['sex'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      orderNo: map['order_no'] != null ? map['order_no'] as int : null,
      charges: map['charges'] != null ? map['charges'] as int : null,
    );
  }
}

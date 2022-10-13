// ignore_for_file: public_member_api_docs, sort_constructors_first

class ReportModel {
  String? name;
  String? sex;
  int? age;
  int? orderNo;
  String? orderStatus;

  ReportModel({
    required this.name,
    required this.sex,
    required this.age,
    required this.orderNo,
    required this.orderStatus,
  });

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      name: map['name'] != null ? map['name'] as String : null,
      sex: map['sex'] != null ? map['sex'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      orderNo: map['order_no'] != null ? map['order_no'] as int : null,
      orderStatus:
          map['order_status'] != null ? map['order_status'] as String : null,
    );
  }
}

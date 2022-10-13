// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? name;
  String? sex;
  int? age;
  int? orderNo;
  String? orderStatus;
  int? charges;
  int? mobileNo;
  String? address;
  int? advance;
  int? due;
  String? sampleStatus;

  UserModel(
      {this.name,
      this.sex,
      this.age,
      this.orderNo,
      this.orderStatus,
      this.charges,
      this.mobileNo,
      this.address,
      this.advance,
      this.due,
      this.sampleStatus});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'sex': sex,
      'age': age,
      'orderNo': orderNo,
      'orderStatus': orderStatus,
      'charges': charges,
      'mobileNo': mobileNo,
      'address': address,
      'advance': advance,
      'due': due,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      sex: map['sex'] != null ? map['sex'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
      orderNo: map['order_no'] != null ? map['order_no'] as int : null,
      orderStatus:
          map['order_status'] != null ? map['order_status'] as String : null,
      charges: map['charges'] != null ? map['charges'] as int : null,
      mobileNo: map['mobile_no'] != null ? map['mobile_no'] as int : null,
      address: map['address'] != null ? map['address'] as String : null,
      advance: map['advance'] != null ? map['advance'] as int : null,
      due: map['due'] != null ? map['due'] as int : null,
      sampleStatus:
          map['sample_statue'] != null ? map['sample_statue'] as String : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:superlabs/model/user_model.dart';

class CurrentUserProvider extends ChangeNotifier {
  UserModel currentModel = UserModel(
    name: '',
    sex: '',
    age: 0,
    orderNo: 0,
    orderStatus: '',
    charges: 0,
    mobileNo: 0000000000,
    address: '',
    advance: 0,
    due: 0,
    sampleStatus: '',
  );

  void updateUserModel(UserModel model) {
    currentModel = model;
    notifyListeners();
  }
}

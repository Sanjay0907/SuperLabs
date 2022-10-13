import 'dart:async';

import 'package:flutter/material.dart';
import 'package:superlabs/model/demo_json/report_json.dart';
import 'package:superlabs/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = true;
  List<UserModel> userDatas = [];
  UserProvider() {
    fetchReportData();
  }
  Future<void> fetchReportData() async {
    List<dynamic> reports = reportJson;
    List<UserModel> temp = [];
    for (var newReport in reports) {
      UserModel newRPT = UserModel.fromMap(newReport);
      temp.add(newRPT);
    }
    userDatas = temp;
    isLoading = false;
    notifyListeners();
  }
}

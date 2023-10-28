import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mk_mining_admin/configs/urls.dart';
import 'package:mk_mining_admin/models/all_user_mod.dart';

Future<AllUserModel> allUserService({required String token}) async {
  debugPrint("call allUserService");
  final Uri url = Uri.parse(AppUrls.allUser);
  final AllUserModel allUserModel = AllUserModel();
  try {
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      final allUserModel2 = allUserModelFromJson(response.body);
      final status = allUserModel2.status;
      if (status != null && status == 1) {
        debugPrint("status in allUserService: $status");
        return allUserModel2;
      } else {
        debugPrint("status in allUserService: $status");
        return allUserModel2;
      }
    } else {
      debugPrint(
          "response.statusCode in allUserService: ${response.statusCode}");
      allUserModel.status = 0;
      allUserModel.message = "Not found";
      allUserModel.data = null;
      return allUserModel;
    }
  } on TimeoutException catch (e) {
    debugPrint("TimeoutException in allUserService: $e");
    allUserModel.status = 0;
    allUserModel.message = "Time out";
    allUserModel.data = null;
    return allUserModel;
  } on SocketException catch (e) {
    debugPrint("SocketException in allUserService: $e");
    allUserModel.status = 0;
    allUserModel.message = "Internet connection failed";
    allUserModel.data = null;
    return allUserModel;
  } catch (e) {
    debugPrint("exception in allUserService: $e");
    allUserModel.status = 0;
    allUserModel.message = "Something went wrong";
    allUserModel.data = null;
    return allUserModel;
  }
}

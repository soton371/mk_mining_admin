import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mk_mining_admin/configs/urls.dart';
import 'package:http/http.dart' as http;

Future<bool> activeDeactivateService(
    {required String token, required String id}) async {
  debugPrint("call activeDeactivateService");
  final Uri url = Uri.parse(AppUrls.activeInactiveUser);

  final Map<String, String> payload = {"id": id};

  try {
    final response = await http.post(url,headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}, body: payload);
    if (response.statusCode == 200) {
    debugPrint("done");
    return true;
  } else {
    debugPrint("failed");
    return false;
  }
  } catch (e) {
    debugPrint("failed");
    return false;
  }
}

import 'package:http/http.dart' as http;
import 'package:WMS_Application/Model/Constants.dart';
import 'package:WMS_Application/Model/ProjectDataResponse.dart';

import 'dart:async';
import 'dart:convert';

import 'RestServices.dart';

Future<List<ProjectDataResponse>?> getProjectAuthority() async {
  try {
    final response = await http.get(Uri.parse(GetHttpRequest(
        WebApiProjectPrefix, 'GetProjectAuthorityForWMS?userid=30020')));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<ProjectDataResponse> loginResult = <ProjectDataResponse>[];
      json.forEach((v) => loginResult.add(ProjectDataResponse.fromJson(v)));
      return loginResult;
    } else {
      throw Exception("API Consumed Failed");
    }
  } on Exception catch (_, ex) {
    throw Exception("API Consumed Failed");
  }
}

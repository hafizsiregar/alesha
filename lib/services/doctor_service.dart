import 'dart:convert';
import 'package:alesha/models/doctor_model.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  var data = [];
  List<DoctorModel> results = [];
  String baseUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<List<DoctorModel>> getDoctorList({String? query}) async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);

    try {
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      results = data.map((item) => DoctorModel.fromJson(item)).toList();
      if (query != null) {
        results = results.where((item) => item.name!.toLowerCase().contains(query.toLowerCase())).toList();
      }
    } else {
      print('Failed to load data');
    }
  } on Exception catch (e) {
    print(e);
  }
  return results;
  }
}
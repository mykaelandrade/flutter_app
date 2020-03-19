import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sample/model/Pic.dart';

class RemoteDataSource {
  RemoteDataSource();

  Future<List<Pic>> getPics() async {
    final response = await http.get('https://5e6b9a6cd708a000160b4b94.mockapi.io/persons');
    if (response.statusCode == 200) {
      final resData = json.decode(response.body);
      List<Pic> pics = [];
      resData.forEach((p) {
        final Pic pic = Pic.fromJson(p);
        pics.add(pic);
      });
      return pics;
    } else {
      throw Exception("Failed to load pics");
    }
  }
}

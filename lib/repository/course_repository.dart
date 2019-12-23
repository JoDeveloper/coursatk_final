
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/courses.dart';

class CoursesRepository {
  static final String url = 'http://coursatk.jodeveloper.com';

  Future<List<Course>> getCourses() async {
    var response = await http.post('$url/api/courses/all',
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Course> courses = body
          .map(
            (dynamic item) => Course.fromJson(item),
          )
          .toList();

      return courses;
    } else {
      throw "Can't get courses.";
    }
  }
  
}

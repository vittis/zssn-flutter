import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api.dart' as api;
import '../../models/Survivor.dart';

String url = '${api.url}/people.json';

Future<List<Survivor>> getSurvivors() async {
  try {
    final response = await http.get(url);

    Iterable data = json.decode(response.body);
    List<Survivor> survivors =
        data.map((model) => Survivor.fromJson(model)).toList();

    return survivors;
  } catch (err) {
    throw Exception(err);
  }
}

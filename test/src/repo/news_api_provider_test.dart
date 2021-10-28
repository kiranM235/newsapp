import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:news/src/repo/news_api_provider.dart';

void main(){
  final apiProvider = NewsApiProvider();
  test('To test whether fetchTopIds indeed returns top ids', () async {
    final ids = [29019161, 29019328, 29019226];

    apiProvider.client = MockClient((request) async {
      return Response(jsonEncode(ids), 200);
    });

    final result = await apiProvider.fetchTopIds();

    expect(ids, result);
  });
}
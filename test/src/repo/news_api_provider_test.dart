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

  test('to test whether *fetchItems* indeed returns an item model', () async {
    final data = {
        "by" : "dhouston",
        "descendants" : 71,
        "id" : 8863,
        "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
        "score" : 111,
        "time" : 1175714200,
        "title" : "My YC app: Dropbox - Throw away your USB drive",
        "type" : "story",
        "url" : "http://www.getdropbox.com/u/2/screencast.html"
      };
      apiProvider.client = MockClient((request) async{
        return Response(jsonEncode(data), 200);
      });
      final result = await apiProvider.fetchItem(8863);

      expect(111, result!.score);
      expect("My YC app: Dropbox - Throw away your USB drive", result.title);

  });
}
import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/src/models/item_model.dart';

class NewsApiProvider {
  Client client = Client();
  /// 1. fetch top ids

  Future<List<int>> fetchTopIds () async{
    final response = await client.get(
        Uri.parse("https://hacker-news.firebaseio.com/v0/topstories.json"));
    final body = jsonDecode(response.body);
    return body;
  }

  /// 2. fetch item with the given id
  Future<ItemModel> fetchItem(int id) async{
    final response = await client
        .get(Uri.parse("https://hacker-news.firebaseio.com/v0/item/$id.json"));
    final body = jsonDecode(response.body);
    final item = ItemModel.fromJson(body);
    return item;
  }
}
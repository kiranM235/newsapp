import 'package:news/src/models/item_model.dart';
import 'package:news/src/repo/news_api_provider.dart';
import 'package:news/src/repo/news_db_provider.dart';
import 'package:news/src/repo/sources.dart';

class Repository {
  final NewsDbProvider dbProvider;
  final NewsApiProvider apiProvider;

  Repository(this.dbProvider, this.apiProvider);

  late List<Source> sources = [
    dbProvider,
    apiProvider
  ];

  late List<Cache> caches = [
  dbProvider,
  ];

  Future<List<int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }


  Future<ItemModel> fetchItem(int id) async {
    // var item = await dbProvider.fetchItem(id);
    // if(item == null){
    //   item = await apiProvider.fetchItem(id);
    //   await dbProvider.insertItem(item!);
    // }
    // return item;
    ItemModel? item;
    Source? source;
    for( source in sources){
      item = await source.fetchItem(id);
      if(item != null){
        break;
      }
    }
    for(var cache in caches){
      if(source! as Cache != cache) {
        cache.insertItem(item!);
      }
    }
    return item!;
  }
}
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/src/repo/repository.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Repository repository;
  NewsBloc(this.repository) : super(NewsInitial());
  // final NewsApiProvider apiProvider = NewsApiProvider();
  // final NewsDbProvider dbProvider = NewsDbProvider();
  // late Repository repository = Repository(dbProvider, apiProvider);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchTopIdsEvent) {
      yield NewsLoading();

      final ids = await repository.fetchTopIds();

      yield NewsData(ids);
    } else if (event is RefreshEvent) {}
  }
}
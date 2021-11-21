import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/bloc/news_bloc.dart';
import 'package:news/src/repo/repository.dart';
import 'package:news/src/widgets/news_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = RepositoryProvider.of<Repository>(context);
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(repository),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Trending News"),
            centerTitle: true,
          ),
          body: buildnewslist(),
        ),
      ),
    );
  }

  Builder buildnewslist() {
    return Builder(builder: (context) {
      /// add event to the bloc
      final newsBloc = BlocProvider.of<NewsBloc>(context);
      newsBloc.add(FetchTopIdsEvent());
      return BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsError) {
            return Center(
              child: Text(state.message),
            );
          }
          NewsData data = state as NewsData;
          final ids = data.ids;
          return _buildNewsContent(ids, newsBloc);
        },
      );
    });
  }

  Container _buildNewsContent(List<int> ids, NewsBloc newsBloc) {
    print("Total news items ${ids.length}");
    return Container(
      padding: EdgeInsets.all(8),
      child: RefreshIndicator(
        onRefresh: () async {
          // Todo clear local database
          /// fetch top ids
          newsBloc.add(RefreshEvent());
          newsBloc.add(FetchTopIdsEvent());

        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            print("Current index ${ids[index]}");

            final item = newsBloc.getItemById(ids[index]);

            return NewsItem(item: item, id: ids[index]);
          },
          itemCount: ids.length,
        ),
      ),
    );
  }
}

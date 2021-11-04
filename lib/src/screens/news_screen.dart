import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news/src/bloc/news/news_bloc.dart';
// import 'package:news/src/repo/repository.dart';
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
          ),
          body: Builder(
              builder: (context) {
                return Container();
              }
          ),
        ),
      ),
    );
  }
}
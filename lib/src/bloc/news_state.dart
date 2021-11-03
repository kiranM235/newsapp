part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsError extends NewsState {
  final String message;
  NewsError(this.message);

  @override
  List<Object?> get props => [message];

}

class NewsData extends NewsState {
  final List<int> ids;
  NewsData(this.ids);

  NewsData copy(List<int>? ids) {
    return NewsData(ids ?? this.ids);
  }

  @override
  List<Object?> get props => [ids];
}
part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchTopIdsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];

}

class RefreshEvent extends NewsEvent {
  @override
  List<Object?> get props => [];

}


